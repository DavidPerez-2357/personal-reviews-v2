import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'package:personal_reviews/database/tables/category.dart';
import 'package:personal_reviews/database/tables/folder.dart';
import 'package:personal_reviews/database/tables/item.dart';
import 'package:personal_reviews/database/tables/review.dart';
import 'package:personal_reviews/database/tables/review_image.dart';

part 'app_database.g.dart';

/// Base de datos principal.
///
/// Arquitectura recomendada:
/// - Drift como ORM/query builder
/// - SQLite nativo
/// - Migraciones gestionadas por Drift
/// - DAOs para acceso a datos
/// - Modelos de dominio separados de las rows Drift
///
/// NO usar:
/// - rawQuery()
/// - strings SQL repartidos por la app
/// - singleton global estático
///
/// Recomendado:
/// - Inyectar esta clase con Riverpod/GetIt
/// - Mantener lógica SQL dentro de DAOs
@DriftDatabase(
  tables: [Categories, Folders, Items, Reviews, ReviewImages],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  static final isInDebugMode = false;

  /// Incrementar cada vez que cambie el schema.
  @override
  int get schemaVersion => 1;

  // TODO: DAOs

  /// Apertura lazy.
  ///
  /// Ventajas:
  /// - no bloquea startup
  /// - inicialización async limpia
  /// - permite setup SQLite antes de abrir
  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final documentsDirectory = await getApplicationDocumentsDirectory();

      final file = File(
        path.join(documentsDirectory.path, 'personal_reviews.db'),
      );

      return NativeDatabase.createInBackground(
        file,
        setup: (database) {
          // Obligatory foreign keys ON.
          database.execute('PRAGMA foreign_keys = ON;');

          // WAL improves concurrency and performance, especially for mobile apps.
          database.execute('PRAGMA journal_mode = WAL;');

          // Recommended for mobile apps: balance between durability and performance. 
          database.execute('PRAGMA synchronous = NORMAL;');

          // SQLitle cache
          database.execute('PRAGMA cache_size = -20000;');

          // Memory temp store for faster temp tables and indices.
          database.execute('PRAGMA temp_store = MEMORY;');
        },
      );
    });
  }

  
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _seedInitialData();
      },

      onUpgrade: (Migrator m, int from, int to) async {
        // Aquí se gestionan las migraciones entre versiones.
        // Ejemplo:
        // if (from < 2) {
        //   await m.addColumn(items, items.newColumn);
        // }
      },

      beforeOpen: (openingDetails) async {
        if (isInDebugMode) {
          final m = createMigrator();
          for (final table in allTables) {
            await m.deleteTable(table.actualTableName);
            await m.createTable(table);
          }
        }
      },
    );
  }

  Future<void> _seedInitialData() async {
    await batch((batch) {
      batch.insertAll(categories, [
        CategoriesCompanion.insert(
          name: 'Libros',
          color: '#1EA500',
          icon: '--',
        ),

        CategoriesCompanion.insert(
          name: 'Comida',
          color: '#F05000',
          icon: '--',
        ),

        CategoriesCompanion.insert(
          name: 'Paises',
          color: '#0062FF',
          icon: '--',
        ),

        CategoriesCompanion.insert(
          name: 'Videojuegos',
          color: '#C000FF',
          icon: '--',
        ),
      ]);
    });
  }

  /// REMOVE THIS IN PRODUCTION. Only for development to reset the database.
  Future<void> deleteDatabase() async {
    // Importante: cerrar conexiones antes de borrar
    await close();

    final dbFolder = await getApplicationDocumentsDirectory();

    final file = File(
      path.join(dbFolder.path, 'personal_reviews.db'),
    );

    if (await file.exists()) {
      await file.delete();
    }
  }
}
