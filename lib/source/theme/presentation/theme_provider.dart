import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());

class AppThemeState extends ChangeNotifier {
  var isDarkModeEnabled = false;
  var isHighContrastEnabled = false;

  void setLightTheme() {
    isDarkModeEnabled = false;
    notifyListeners();
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    notifyListeners();
  }

  void setHighContrast() {
    isHighContrastEnabled = true;
    notifyListeners();
  }

  void unsetHighContrast() {
    isHighContrastEnabled = false;
    notifyListeners();
  }
}
