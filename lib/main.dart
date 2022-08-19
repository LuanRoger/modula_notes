import 'package:flutter/material.dart';
import 'package:modula_notes/controllers/sembas_controller.dart';
import 'package:modula_notes/pages/home_page.dart';
import 'package:modula_notes/providers/notes_db_provider.dart';
import 'package:modula_notes/providers/notes_provider.dart';
import 'package:modula_notes/shared/app_themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SembastController sembasController = SembastController();
  NotesDbProvider notesDbProvider =
      NotesDbProvider(await sembasController.initDb());

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NotesProvider>(
        create: (_) => NotesProvider(),
      ),
      Provider<NotesDbProvider>(create: (_) => notesDbProvider)
    ],
    child: MaterialApp(
      theme: AppThemes.lightThemeData,
      home: const HomePage(),
    ),
  ));
}
