import 'package:drift/drift.dart';
import 'package:personal_reviews/database/tables/folders_table.dart';

@TableIndex(name: 'folder_trees_index', columns: {#descendantId, #ancestorId})
class FolderTrees extends Table {
  IntColumn get descendantId =>
      integer().references(Folders, #id, onDelete: KeyAction.cascade)();

  IntColumn get ancestorId =>
      integer().references(Folders, #id, onDelete: KeyAction.cascade)();

  IntColumn get depth => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {descendantId, ancestorId};
}
