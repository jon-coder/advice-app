import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  static ThemeService? _instance;
  ThemeService._();

  static ThemeService get i {
    _instance ??= ThemeService._();
    return _instance!;
  }

  bool isDarkModeOn = false;
  void toggleTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }
}

extension ThemeServiceExtension on BuildContext {
  ThemeService get themeService => ThemeService.i;
}
