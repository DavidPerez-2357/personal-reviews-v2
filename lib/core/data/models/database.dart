import 'package:personal_reviews/core/interfaces/db_model.dart';

class DatabaseMigration implements DbModel<DatabaseMigration> {
  final int version;
  final String description;
  final String assetPath;

  const DatabaseMigration({
    required this.version,
    required this.description,
    required this.assetPath,
  });

  @override
  factory DatabaseMigration.fromJson(Map<String, dynamic> map) {
    return DatabaseMigration(
      version: map['version'],
      description: map['description'],
      assetPath: map['asset_path'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'description': description,
      'asset_path': assetPath,
    };
  }
}

class DatabaseSeed implements DbModel<DatabaseSeed> {
  final int id;
  final String description;
  final String assetPath;

  const DatabaseSeed({
    required this.id,
    required this.description,
    required this.assetPath,
  });

  @override
  factory DatabaseSeed.fromJson(Map<String, dynamic> map) {
    return DatabaseSeed(
      id: map['id'],
      description: map['description'],
      assetPath: map['asset_path'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'asset_path': assetPath,
    };
  }
}