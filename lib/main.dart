import 'package:flutter/material.dart';
import 'package:modula_notes/controllers/sembas_controller.dart';
import 'package:modula_notes/pages/home_page.dart';
import 'package:modula_notes/providers/notes_db_provider.dart';
import 'package:modula_notes/providers/notes_provider.dart';
import 'package:modula_notes/providers/settings_provider.dart';
import 'package:modula_notes/routes/app_routes_driver.dart';
import 'package:modula_notes/shared/app_themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SembastController sembasController = SembastController();
  NotesDbProvider notesDbProvider =
      NotesDbProvider(await sembasController.initDb());

  SettingsProvider settingsProvider = SettingsProvider();
  await settingsProvider.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NotesProvider>(
        create: (_) => NotesProvider(),
      ),
      ChangeNotifierProvider(create: (_) => settingsProvider),
      Provider<NotesDbProvider>(create: (_) => notesDbProvider)
    ],
    child: Consumer<SettingsProvider>(
      builder: (_, value, __) => MaterialApp(
        themeMode: value.darkMode ? ThemeMode.dark : ThemeMode.light,
        theme: AppThemes.lightThemeData,
        darkTheme: AppThemes.darkThemeData,
        initialRoute: "/",
        onGenerateRoute: AppRoutesDriver.goToRoute,
        home: const HomePage(),
      ),
    ),
  ));
}
