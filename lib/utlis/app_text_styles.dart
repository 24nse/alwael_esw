
import 'package:flutter/material.dart';
import 'package:profile_barsh_web/utlis/app_fonts.dart';

import 'app_colors.dart';
import 'get_responsive_font_size.dart';

abstract class AppTextStyles {
  static TextStyle styleLight12(context,
      {double? fontSize,
        Color? color,
        bool underLine = false,
        FontWeight? fontWeight}) {
    return TextStyle(
        color: color ?? kTextColor,
        fontSize: getResponsiveFontSize(context, fontSize: fontSize ?? 12),
        fontFamily: AppFonts.cairo,
        fontWeight: fontWeight ?? FontWeight.w300,
        decoration: underLine ? TextDecoration.underline : null,
        decorationColor: color);
  }

  static TextStyle styleLight14(context,
      {double? fontSize,
        Color? color,
        bool underLine = false,
        FontWeight? fontWeight}) {
    return TextStyle(
        color: color ?? kTextColor,
        fontSize: getResponsiveFontSize(context, fontSize: fontSize ?? 14),
        fontFamily: AppFonts.cairo,
        fontWeight: fontWeight ?? FontWeight.w300,
        decoration: underLine ? TextDecoration.underline : null,
        decorationColor: color);
  }

  static TextStyle styleRegular12(
      BuildContext context, {
        double? fontSize,
        Color? color,
        bool underLine = false,
        FontWeight? fontWeight,
      }) {
    return TextStyle(
        color: color ?? kTextColor,
        fontSize: getResponsiveFontSize(context, fontSize: fontSize ?? 12),
        fontFamily: AppFonts.cairo,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: underLine ? TextDecoration.underline : null,
        decorationColor: color);
  }

  static TextStyle styleRegular14(BuildContext context,
      {double? fontSize,
        Color? color,
        bool underLine = false,
        FontWeight? fontWeight}) {
    return TextStyle(
        color: color ?? kTextColor,
        fontSize: getResponsiveFontSize(context, fontSize: fontSize ?? 14),
        fontFamily: AppFonts.cairo,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: underLine ? TextDecoration.underline : null,
        decorationColor: color);
  }

  static TextStyle styleMedium12(BuildContext context,
      {double? fontSize,
        Color? color,
        bool underLine = false,
        FontWeight? fontWeight}) {
    return TextStyle(
        color: color ?? kTextColor,
        fontSize: getResponsiveFontSize(context, fontSize: fontSize ?? 12),
        fontFamily: AppFonts.cairo,
        fontWeight: fontWeight ?? FontWeight.w500,
        decoration: underLine ? TextDecoration.underline : null,
        decorationColor: color);
  }

  static TextStyle styleMedium14(BuildContext context,
      {double? fontSize,
        Color? color,
        bool underLine = false,
        FontWeight? fontWeight}) {
    return TextStyle(
        color: color ?? kTextColor,
        fontSize: getResponsiveFontSize(context, fontSize: fontSize ?? 14),
        fontFamily: AppFonts.cairo,
        fontWeight: fontWeight ?? FontWeight.w500,
        decoration: underLine ? TextDecoration.underline : null,
        decorationColor: color);
  }

  static TextStyle styleRegular20(BuildContext context, {Color? color}) {
    return TextStyle(
      color: color ?? kTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: AppFonts.cairo,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular10(BuildContext context, {Color? color}) {
    return TextStyle(
      color: color ?? kTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: AppFonts.cairo,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold20(
      BuildContext context, {
        Color? color,
        double? fontSize,
      }) {
    return TextStyle(
      color: color ?? kTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: fontSize ?? 20),
      fontFamily: AppFonts.cairo,
      fontWeight: FontWeight.bold,
    );
  }

// In your AppTextStyles class

  static TextStyle styleRegular16(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? kTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: AppFonts.cairo,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static TextStyle styleBold32(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? kTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontFamily: AppFonts.cairo,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle styleBold36(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? kTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 36),
      fontFamily: AppFonts.cairo,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  // In your AppTextStyles class

  static TextStyle styleBold24(BuildContext context, {Color? color}) {
    return TextStyle(
      color: color ?? kTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: AppFonts.cairo,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleBold29(BuildContext context, {Color? color}) {
    return TextStyle(
      color: color ?? kTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 29),
      fontFamily: AppFonts.cairo,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleRegular18(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? kTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: AppFonts.cairo,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static TextStyle styleMedium18(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? kTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: AppFonts.cairo,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }
}