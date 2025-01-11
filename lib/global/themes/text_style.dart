// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_palette.dart';

Color defaultTextColor =
    ColorPalette.coolNeutral22.withOpacity(ColorPalette.opacity88);

class CustomTextStyle {
  final FontWeight? fontWeight;
  Color? fontColor;

  CustomTextStyle.of({this.fontWeight = FontWeight.w600, this.fontColor});

  TextStyleScheme get style => sympleTextStyle;

  //symple typography
  // TextStyle get heading =>
  //     style.heading.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get title =>
      style.title.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get subTitle =>
      style.subTitle.copyWith(color: fontColor ?? defaultTextColor);

  /// fontWeight : Semibold
  TextStyle get body1 =>
      style.body1.copyWith(color: fontColor ?? defaultTextColor);

  /// fontWeight : Regular
  TextStyle get body2 =>
      style.body2.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get caption =>
      style.caption.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get undertext =>
      style.undertext.copyWith(color: fontColor ?? defaultTextColor);

  Heading get heading => Heading(fontColor);
  Body get body => Body(fontColor);
}

/// Heading Text Styles
class Heading {
  Color? fontColor;

  Heading(this.fontColor);

  TextStyleScheme get style => sympleTextStyle;

  HeadingMobileTextStyle get mobile => HeadingMobileTextStyle(fontColor);
}

class HeadingMobileTextStyle {
  Color? fontColor;

  HeadingMobileTextStyle(this.fontColor);

  TextStyleScheme get style => sympleTextStyle;

  TextStyle get xl4 =>
      style.mobile_4xl.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get xl3 =>
      style.mobile_3xl.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get xl2 =>
      style.mobile_2xl.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get xl =>
      style.mobile_xl.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get lg =>
      style.mobile_lg.copyWith(color: fontColor ?? defaultTextColor);
}

/// Body Text Styles
class Body {
  Color? fontColor;

  Body(this.fontColor);

  TextStyleScheme get style => sympleTextStyle;

  BodyLgTextStyle get lg => BodyLgTextStyle(fontColor);
  BodyMdTextStyle get md => BodyMdTextStyle(fontColor);
  BodySmTextStyle get sm => BodySmTextStyle(fontColor);
}

class BodyLgTextStyle {
  Color? fontColor;

  BodyLgTextStyle(this.fontColor);

  TextStyleScheme get style => sympleTextStyle;

  TextStyle get semibold =>
      style.lg_semibold.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get medium =>
      style.lg_medium.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get regular =>
      style.lg_regular.copyWith(color: fontColor ?? defaultTextColor);
}

class BodyMdTextStyle {
  Color? fontColor;

  BodyMdTextStyle(this.fontColor);

  TextStyleScheme get style => sympleTextStyle;

  TextStyle get semibold =>
      style.md_semibold.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get medium =>
      style.md_medium.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get regular =>
      style.md_regular.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get underline =>
      style.md_underline.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get code =>
      style.md_code.copyWith(color: fontColor ?? defaultTextColor);
}

class BodySmTextStyle {
  Color? fontColor;

  BodySmTextStyle(this.fontColor);

  TextStyleScheme get style => sympleTextStyle;

  TextStyle get semibold =>
      style.sm_semibold.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get medium =>
      style.sm_medium.copyWith(color: fontColor ?? defaultTextColor);
  TextStyle get regular =>
      style.sm_regular.copyWith(color: fontColor ?? defaultTextColor);
}

class TextStyleScheme {
  TextStyle heading;
  TextStyle title;
  TextStyle subTitle;
  TextStyle body1;
  TextStyle body2;
  TextStyle caption;
  TextStyle undertext;

  TextStyle mobile_4xl;
  TextStyle mobile_3xl;
  TextStyle mobile_2xl;
  TextStyle mobile_xl;
  TextStyle mobile_lg;
  TextStyle mobile_md;
  TextStyle lg_semibold;
  TextStyle lg_medium;
  TextStyle lg_regular;
  TextStyle md_semibold;
  TextStyle md_medium;
  TextStyle md_regular;
  TextStyle md_underline;
  TextStyle md_code;
  TextStyle sm_semibold;
  TextStyle sm_medium;
  TextStyle sm_regular;

  TextStyleScheme({
    required this.heading,
    required this.title,
    required this.subTitle,
    required this.body1,
    required this.body2,
    required this.caption,
    required this.undertext,
    required this.mobile_4xl,
    required this.mobile_3xl,
    required this.mobile_2xl,
    required this.mobile_xl,
    required this.mobile_lg,
    required this.mobile_md,
    required this.lg_semibold,
    required this.lg_medium,
    required this.lg_regular,
    required this.md_semibold,
    required this.md_medium,
    required this.md_regular,
    required this.md_underline,
    required this.md_code,
    required this.sm_semibold,
    required this.sm_medium,
    required this.sm_regular,
  });
}

final TextStyleScheme sympleTextStyle = TextStyleScheme(
  heading: const TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w600, // Semibold
    height: 34 / 26, // Line height is 34px
    letterSpacing: -3 / 26, // -3% letter spacing
  ),
  title: const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600, // Semibold
    height: 28 / 20, // Line height is 28px
    letterSpacing: -3 / 20, // -3% letter spacing
  ),
  subTitle: const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600, // Semibold
    height: 26 / 18, // Line height is 26px
    letterSpacing: -2 / 18, // -2% letter spacing
  ),
  body1: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600, // Semibold
    height: 24 / 16, // Line height is 24px
    letterSpacing: -2 / 16, // -2% letter spacing
  ),
  body2: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400, // Regular
    height: 24 / 16, // Line height is 24px
    letterSpacing: -2 / 16, // -2% letter spacing
  ),
  caption: const TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w500, // Medium
    height: 20 / 13, // Line height is 20px
    letterSpacing: -2 / 13, // -2% letter spacing
  ),
  undertext: const TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w600, // Semibold
    height: 16 / 11, // Line height is 16px
    letterSpacing: -2 / 11, // -2% letter spacing
  ),

  // mobile style
  mobile_4xl: const TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w700,
    height: 1.4,
  ),
  mobile_3xl: const TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    height: 1.4,
  ),
  mobile_2xl: const TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
  ),
  mobile_xl: const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
  ),
  mobile_lg: const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
  ),
  mobile_md: const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
  ),

  //lg style
  lg_semibold: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    height: 1.6,
  ),
  lg_medium: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 1.6,
  ),
  lg_regular: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.6,
  ),

  // md style
  md_semibold: const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    height: 1.6,
  ),
  md_medium: const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 1.6,
  ),
  md_regular: const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.6,
  ),
  md_underline: const TextStyle(
    // TODO: underline style add
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    height: 1.6,
  ),
  md_code: const TextStyle(
    // TODO: code style add
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    height: 1.6,
  ),

  //sm style
  sm_semibold: const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    height: 1.6,
  ),
  sm_medium: const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 1.6,
  ),
  sm_regular: const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 1.6,
  ),
);

// Define the text styles for each type
