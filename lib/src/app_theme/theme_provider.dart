import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    textTheme: TextTheme(
        // headline1: TextStyle(color: Colors.orange),
        // headline2: TextStyle(color: Colors.orange),
        // headline3: TextStyle(color: Colors.orange),
        // headline4: TextStyle(color: Colors.orange),
        // headline5: TextStyle(color: Colors.orange),
        // headline6: TextStyle(color: Colors.orange),
        // subtitle1: TextStyle(color: Colors.orange),
        // subtitle2: TextStyle(color: Colors.orange),
        // bodyText1: TextStyle(color: Colors.brown),
        bodyText2:TextStyle(color: Colors.white),



    ),
     // colorScheme: ColorScheme.dark(),
    // textTheme: TextTheme(caption: TextStyle(color: Colors.blue)),
    // primaryTextTheme: TextTheme(caption: TextStyle(color: Colors.blue)),
    appBarTheme: AppBarTheme(color: appColors.appBgColor2),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.orange),
      headline2: TextStyle(color: Colors.orange),
      headline3: TextStyle(color: Colors.orange),
      headline4: TextStyle(color: Colors.orange),
      headline5: TextStyle(color: Colors.orange),
      headline6: TextStyle(color: Colors.orange),
      subtitle1: TextStyle(color: Colors.orange),
      subtitle2: TextStyle(color: Colors.orange),
      bodyText1: TextStyle(color: Colors.brown),
      bodyText2:TextStyle(color: Colors.black),
      caption: TextStyle(color: Colors.orange),
      button: TextStyle(color: Colors.orange),
      overline: TextStyle(color: Colors.orange),
    ),
    // colorScheme: ColorScheme.light(),
    // textTheme: TextTheme(caption: TextStyle(color: Colors.teal)),
    // primaryTextTheme: TextTheme(caption: TextStyle(color: Colors.teal)),
    appBarTheme: AppBarTheme(backgroundColor: appColors.white,titleTextStyle: TextStyle(color: Colors.black),),
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );
}
