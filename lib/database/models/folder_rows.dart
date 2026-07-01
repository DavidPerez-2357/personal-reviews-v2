import 'package:personal_reviews/database/app_database.dart';

class FolderDetailedRow {
  final Folder folder;
  final int itemCount;
  final List<String> previewImages;

  FolderDetailedRow({
    required this.folder,
    required this.itemCount,
    required this.previewImages,
  });
}

class FolderWithItemCountRow {
  final Folder folder;
  final int itemCount;

  FolderWithItemCountRow({required this.folder, required this.itemCount});
}
