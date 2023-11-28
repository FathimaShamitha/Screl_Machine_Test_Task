import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/utils/constants/themes/mycolor.dart';

class MyTextStyle{
  static TextStyle appBarText = GoogleFonts.lato(color: MyAppColor.appBarTextColor,fontSize: 25);
  static TextStyle bodyText = GoogleFonts.lato(color: MyAppColor.bodyTextColor,fontSize: 18);
  static TextStyle buttonText = GoogleFonts.lato(color: MyAppColor.buttonTextColor,fontSize: 20);
  static TextStyle listTileText = GoogleFonts.lato(color: MyAppColor.listTileTextColor,fontSize: 18);
}