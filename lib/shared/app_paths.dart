import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AppPaths {
  static Future<Directory> getAppDocumentDir() async {
    return await getApplicationDocumentsDirectory();
  }

  static Future<String> sembasDbPath() async {
    Directory appDocs = await getAppDocumentDir();
    return join(appDocs.path, "modula_notes.db");
  }
}
