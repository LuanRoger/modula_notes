import 'package:flutter/cupertino.dart';
import 'package:modula_notes/providers/models/theme_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  late SharedPreferences _preferences;
  late ThemePreferences _themePreferences;

  Future init() async {
    _preferences = await SharedPreferences.getInstance();
    addListener(() async => await saveSettings());

    bool? darkTheme = _preferences.getBool("darkTheme");
    _themePreferences = ThemePreferences(isDarkMode: darkTheme ?? false);
  }

  bool get darkMode => _themePreferences.isDarkMode;
  set darkMode(bool isDarkMode) {
    _themePreferences.isDarkMode = isDarkMode;
    notifyListeners();
  }

  Future saveSettings() async {
    await _preferences.setBool("darkTheme", _themePreferences.isDarkMode);
  }
}
