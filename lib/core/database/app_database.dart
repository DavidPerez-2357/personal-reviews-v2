import 'package:flutter/services.dart';
import 'package:personal_reviews/core/data/models/database.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static Database? _database;

  static const _databaseName = 'personal_reviews_v2.db';
  static const _databaseVersion = 2;

  static const String _migrationTable = 'database_migrations';
  static const String _seedsTable = 'database_seeds';

  static const String _databaseAssetsPath = 'assets/database';
  static const String _migrationsAssetsPath = '$_databaseAssetsPath/migrations';
  static const String _seedsAssetsPath = '$_databaseAssetsPath/seeds';

  static const migrations = <DatabaseMigration>[
    DatabaseMigration(
      version: 1,
      description: 'Add config tables',
      assetPath:
          '$_migrationsAssetsPath/001_config_tables.sql',
    ),
    DatabaseMigration(
      version: 2,
      description: 'Initial database schema',
      assetPath:
          '$_migrationsAssetsPath/002_init_database.sql',
    ),
  ];

  static const seeds = <DatabaseSeed>[
    DatabaseSeed(
      id: 1,
      description: 'Seed default categories',
      assetPath:
          '$_seedsAssetsPath/001_seed_categories.sql',
    ),
  ];

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = '$databasePath/$_databaseName';

    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: _onConfigure,
    );
  }

  Future<void> _onConfigure(Database db) async {
    // Activa foreign keys en SQLite
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    await _runMigrations(
      db,
      fromVersion: 0,
      toVersion: version,
    );

    await _runSeeds(db);
  }

  Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    await _runMigrations(
      db,
      fromVersion: oldVersion,
      toVersion: newVersion,
    );

    await _runSeeds(db);
  }

  Future<void> executeAllStatementsInFile(
    Transaction txn,
    String sql,
  ) async {
    // Separar statements por ';'
    final statements = sql
        .split(';')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty);

    for (final statement in statements) {
      await txn.execute(statement);
    }
  }

  Future<void> _runMigrations(
    Database db, {
    required int fromVersion,
    required int toVersion,
  }) async {
    final pendingMigrations = migrations.where(
      (migration) =>
          migration.version > fromVersion &&
          migration.version <= toVersion,
    );

    for (final migration in pendingMigrations) {
      // Check if the migration has already been executed to avoid running it multiple times
      if (migration.version != 1) {
        final alreadyExecuted = await db.query(
          _migrationTable,
          where: 'from_version = ? AND to_version = ?',
          whereArgs: [fromVersion, migration.version],
          limit: 1,
        );

        if (alreadyExecuted.isNotEmpty) {
          continue;
        }
      }

      final sql = await rootBundle.loadString(
        migration.assetPath,
      );


      await db.transaction((txn) async {
        await executeAllStatementsInFile(txn, sql);

        await txn.insert(
          _migrationTable,
          {
            'from_version': fromVersion,
            'to_version': migration.version,
            'executed_at': DateTime.now()
                .millisecondsSinceEpoch,
          },
        );

        fromVersion = migration.version; // Update fromVersion for the next migration
      });
    }
  }

  

  Future<void> _runSeeds(Database db) async {
    for (final seed in seeds) {
      // Check if the seed has already been executed to avoid running it multiple times
      final alreadyExecuted = await db.query(
        _seedsTable,
        where: 'id = ?',
        whereArgs: [seed.id],
        limit: 1,
      );

      if (alreadyExecuted.isNotEmpty) {
        continue;
      }

      final sql = await rootBundle.loadString(
        seed.assetPath,
      );

      await db.transaction((txn) async {
        await txn.execute(sql);

        await txn.insert(
          _seedsTable,
          {
            'id': seed.id,
            'executed_at': DateTime.now()
                .millisecondsSinceEpoch,
          },
        );
      });
    }
  }

  Future<void> close() async {
    final db = await database;

    await db.close();
  }
}