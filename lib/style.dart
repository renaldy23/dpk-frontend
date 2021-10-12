import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// Colors
// const stylePrimaryColor = Color(0xFF3281FF);
const styleAppBackground = Color(0xFFf8f8f8); //Color(0xFFE3F9FD); 
const styleShadowColor = Color(0x95E9EBF0);
const styleTextSecondaryColor = Color(0xFF757575);
const styleViewColor = Color(0xFFDADADA);
const styleSecondaryColorRed = Color(0xFFFF5C5C);
const styleIconColor = Color(0xFFA6A7AA);

const stylePrimaryColor = Color(0xFF2697FF);
const styleSecondaryColor = Color(0xFF2A2D3E);
const styleBgColor = Color(0xFF212332);

const styleDefaultPadding = 16.0;
const kDefaultPadding = 20.0;
const kBgLightColor = Color(0xFFF2F4FC);
const kTextColor = Color(0xFF4D5875);
const kBgDarkColor = Color(0xFFEBEDFA);
const kPrimaryColor = Color(0xFF366CF6);
const kGrayColor = Color(0xFF8793B2);
const kBadgeColor = Color(0xFFEE376E);

// Widget
BoxDecoration styleBoxDecoration(
    {double radius = 8,
    Color color = Colors.transparent,
    Color bgColor = Colors.white,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow
        ? [BoxShadow(color: styleShadowColor, blurRadius: 10, spreadRadius: 2)]
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

TextStyle styleTextStyleBold({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textBoldSizeGlobal,
    color: color ?? textPrimaryColorGlobal,
    fontWeight: weight ?? fontWeightBoldGlobal,
    fontFamily: fontFamily ?? fontFamilyBoldGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
  );
}

TextStyle styleTextStylePrimary({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textPrimarySizeGlobal,
    color: color ?? kBgDarkColor, // textPrimaryColorGlobal,
    fontWeight: weight ?? fontWeightPrimaryGlobal,
    fontFamily: fontFamily ?? fontFamilyPrimaryGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}

// styleSecondaryTextStyle
TextStyle styleTextStyleSecondary({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textSecondarySizeGlobal,
    color: color ?? kGrayColor, // textSecondaryColorGlobal,
    fontWeight: weight ?? fontWeightSecondaryGlobal,
    fontFamily: fontFamily ?? fontFamilySecondaryGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
  );
}