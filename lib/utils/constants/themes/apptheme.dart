import 'package:flutter/material.dart';
import 'package:untitled/utils/constants/themes/mycolor.dart';
import 'package:untitled/utils/constants/themes/mytextsyle.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      appBarTheme: AppBarTheme(
          titleTextStyle: MyTextStyle.appBarText,
          backgroundColor: MyAppColor.primaryColor,
          centerTitle: true),
      iconTheme: IconThemeData(color: MyAppColor.iconColor, size: 20),
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(MyTextStyle.buttonText),
          backgroundColor: MaterialStatePropertyAll(MyAppColor.primaryColor),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ),
      cardTheme: CardTheme(
          color: MyAppColor.cardColor,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      textTheme: TextTheme(bodyMedium: MyTextStyle.bodyText),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          iconSize: 30,
          backgroundColor: MyAppColor.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      dividerTheme:
          DividerThemeData(color: MyAppColor.primaryColor, thickness: 1),
      listTileTheme: ListTileThemeData(
          titleTextStyle: MyTextStyle.listTileText,
          subtitleTextStyle: MyTextStyle.listTileText,
          iconColor: MyAppColor.iconColor,
          textColor: MyAppColor.listTileTextColor),
  );
}
