import 'package:flutter/material.dart';
import 'package:master_v_p_n/app/services/app_preferences.dart';

extension AppTheme on ThemeData {
  Color get lightTextColor => AppPreferences.isModeDark ? Colors.white70 : Colors.black54;
  Color get bottomNavigationColor => AppPreferences.isModeDark ? Colors.white12 : Colors.redAccent;
}
