import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';

class AppStyle {
  /////////// ********  App Theme *****/////////
  static AppColors appColors = AppColors();
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      /* iconTheme: IconThemeData(
        color: Colors.black,
      ),*/
    ),
    colorScheme: ColorScheme.light(
      primary: appColors.primaryColor,
      onPrimary: appColors.primaryColor,
      primaryVariant: appColors.primaryColor,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: appColors.cardBgColor,
    ),
    /* iconTheme: IconThemeData(
      color: appColors.iconColor[100],
    ),*/
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      headline2: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );

  /////////// ********  App Theme *****/////////

  TextStyle titleStyle(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 16,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.semiBold600,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle subTitleStyle(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textSubHeadingColor,
          fontSize: fontSize != null ? fontSize : 12,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.semiBold600,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle1(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 6,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.bold700,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);
  TextStyle hStyle2(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 8,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.bold700,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle3(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 10,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.bold700,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle4(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 11,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.bold700,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle5(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 12,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle6(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 13,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle7(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 14,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle8(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 15,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);
  TextStyle hStyle9(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 16,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);
  TextStyle hStyle10(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 17,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle11(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 18,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle12(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 20,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle13(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 22,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle hStyle14(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 36,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle inputTextStyle1(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 22,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle inputTextStyle2(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 22,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle inputTextStyle3(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 22,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle appBarT1Style(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.appBarTextColor,
          fontSize: fontSize != null ? fontSize : 20,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.bold700,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle appBarT2Style(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.appBarTextColor,
          fontSize: fontSize != null ? fontSize : 24,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.bold700,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle notificationSheetTitleStyle(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 17,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.semiBold600,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle swipeButtonStyle(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.buttonTextColor2,
          fontSize: fontSize != null ? fontSize : 16,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.medium500,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle buttonTextStyle1(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 14,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.semiBold600,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle buttonTextStyle2(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          color: texColor != null ? texColor : appColors.textNormalColor,
          fontSize: fontSize != null ? fontSize : 14,
          fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
          fontWeight: fontWeight != null ? fontWeight : appFonts.semiBold600,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle errorStyle(
          {Color? texColor, double? fontSize, fontFamily, fontWeight}) =>
      TextStyle(
        color: texColor != null ? texColor : Colors.red,
        fontSize: fontSize != null ? fontSize : 10,
        fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
        fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
      );
  TextStyle error1Style(
          {Color? texColor, double? fontSize, fontFamily, fontWeight}) =>
      TextStyle(
        color: texColor != null ? texColor : Colors.red,
        fontSize: fontSize != null ? fontSize : 12,
        fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
        fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
      );

  TextStyle privacyPolicyWithUnderlineStyle1(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          decorationThickness: 1.5,
          decoration: TextDecoration.underline,
          color: texColor != null ? texColor : appColors.primaryColor,
          fontWeight: appFonts.light300,
          fontSize: 14,
          fontFamily: appFonts.defaultFont2,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle privacyPolicyWithUnderlineStyle2(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
          decorationThickness: 1.5,
          decoration: TextDecoration.underline,
          color: texColor != null ? texColor : appColors.primaryColor,
          fontWeight: appFonts.light300,
          fontSize: 14,
          fontFamily: appFonts.defaultFont2,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);

  TextStyle counterTextStyle(
          {Color? texColor,
          double? fontSize,
          fontFamily,
          fontWeight,
          bool isItalic = false}) =>
      TextStyle(
        color: texColor != null ? texColor : appColors.textNormalColor,
        fontSize: fontSize != null ? fontSize : 13,
        fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
        fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
      );
  List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  final selectedImageGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF8351FE),
      Color(0xFFFF5A5F),
    ],
  );

  buttonNameStyle(
          {Color? texColor, double? fontSize, fontFamily, fontWeight}) =>
      TextStyle(
        color: texColor != null ? texColor : appColors.textNormalColor,
        fontSize: fontSize != null ? fontSize : 14,
        fontFamily: fontFamily != null ? fontFamily : appFonts.defaultFont,
        fontWeight: fontWeight != null ? fontWeight : appFonts.regular400,
      );
}

AppStyle appStyles = AppStyle();
