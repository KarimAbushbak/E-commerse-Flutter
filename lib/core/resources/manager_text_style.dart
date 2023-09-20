import 'package:flutter/material.dart';
import 'package:service/core/resources/manager_colors.dart';
import 'package:service/core/resources/manager_font_sizes.dart';
import 'package:service/core/resources/manager_font_weight.dart';
import 'package:service/core/resources/manager_fonts.dart';

TextStyle _getTextStyle({
  required double fontSize,
  String? fontFamily,
  required FontWeight fontWeight,
  Color? color,
  TextDecoration? textDecoration,
  FontStyle? fontStyle,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily = ManagerFontFamily.appFont,
    fontWeight: fontWeight,
    color: color ?? ManagerColors.primaryTextColor,
    decoration: textDecoration ?? TextDecoration.none,
    fontStyle: fontStyle,
  );
}

// Regular text style
TextStyle getRegularTextStyle({
  double? fontSize,
  Color? color,
  TextDecoration? textDecoration,
  FontStyle? fontStyle,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? ManagerFontSizes.s14,
    fontWeight: ManagerFontWeight.regular,
    color: color,
    textDecoration: textDecoration,
    fontStyle: fontStyle,
  );
}

// Bold text style
TextStyle getBoldTextStyle({
  double? fontSize,
  Color? color,
  TextDecoration? textDecoration,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? ManagerFontSizes.s14,
    fontWeight: ManagerFontWeight.bold,
    color: color,
    textDecoration: textDecoration,
  );
}

// Medium text style
TextStyle getMediumTextStyle({
  double? fontSize,
  Color? color,
  TextDecoration? textDecoration,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? ManagerFontSizes.s14,
    fontWeight: ManagerFontWeight.medium,
    color: color,
    textDecoration: textDecoration,
  );
}

TextStyle getTextStyle(
    {double? fontSize,
      Color? color,
      TextDecoration? textDecoration,
      FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize: fontSize ?? ManagerFontSizes.s14,
    fontWeight: fontWeight ?? ManagerFontWeight.regular,
    color: color,
    textDecoration: textDecoration,
  );
}

// Italic text style
TextStyle getItalicTextStyle({
  double? fontSize,
  Color? color,
  TextDecoration? textDecoration,
}) {
  return getRegularTextStyle(
    fontStyle: FontStyle.italic,
  );
}