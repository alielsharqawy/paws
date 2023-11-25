import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/style_manager.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: getBoldStyle(color: Colors.white, fontSize: 35),
        displayMedium: getSemiBoldStyle(color: Colors.black, fontSize: 16),
        titleMedium: getMediumStyle(color: Colors.white, fontSize: 20),
        titleSmall: getMediumStyle(color: Colors.blue, fontSize: 30),
        bodySmall: getRegularStyle(color: Colors.grey),
        bodyLarge: getRegularStyle(color: Colors.blueGrey, fontSize: 28),
        bodyMedium: getMediumStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
