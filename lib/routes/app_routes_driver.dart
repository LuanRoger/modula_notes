import 'package:flutter/material.dart';
import 'package:modula_notes/models/note_model.dart';
import 'package:modula_notes/pages/edit_note_page.dart';
import 'package:modula_notes/pages/home_page.dart';
import 'package:modula_notes/pages/settings_page.dart';
import 'package:modula_notes/pages/view_note_page.dart';
import 'package:modula_notes/routes/app_routes.dart';

class AppRoutesDriver {
  static Route<dynamic> goToRoute(RouteSettings routeSettings) {
    final List<dynamic>? routeArgs = routeSettings.arguments != null
        ? routeSettings.arguments as List<dynamic>
        : null;

    switch (routeSettings.name) {
      case AppRoutes.EDIT_NOTE_ROUTE:
        return goToEditNotePage(routeArgs![0],
            isNewNote: routeArgs[1] ?? false);
      case AppRoutes.VIEW_NOTE_ROUTE:
        return goToViewNotePage(routeArgs![0]);
      case AppRoutes.SETTINGS_ROUTE:
        return goToSettingsPage;
      default:
        return goToHomePage;
    }
  }

  static Route<HomePage> get goToHomePage =>
      MaterialPageRoute(builder: (_) => const HomePage());
  static Route<EditNotePage> goToEditNotePage(NoteModel noteModel,
          {bool isNewNote = false}) =>
      MaterialPageRoute(
          builder: (_) => EditNotePage(
                noteModel,
                isNewNote: isNewNote,
              ));
  static Route<ViewNotePage> goToViewNotePage(NoteModel noteModel) =>
      MaterialPageRoute(builder: (_) => ViewNotePage(noteModel));
  static Route<SettingsPage> get goToSettingsPage =>
      MaterialPageRoute(builder: (_) => const SettingsPage());
}
