import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_palette.dart';

class CustomTextStyle {
  final FontWeight? fontWeight;
  Color? fontColor;

  CustomTextStyle.of({this.fontWeight = FontWeight.w600, this.fontColor});

  // labelNetural
  Color defaultTextColor =
      ColorPalette.coolNeutral22.withOpacity(ColorPalette.opacity88);

  TextStyleScheme get style => sympleTextStyle;

  TextStyle get display1 => style.display1.copyWith(fontWeight: fontWeight);
  TextStyle get display2 => style.display2.copyWith(fontWeight: fontWeight);
  TextStyle get title1 => style.title1.copyWith(fontWeight: fontWeight);
  TextStyle get title2 => style.title2.copyWith(fontWeight: fontWeight);
  TextStyle get title3 => style.title3.copyWith(fontWeight: fontWeight);
  TextStyle get heading1 => style.heading1.copyWith(fontWeight: fontWeight);
  TextStyle get heading2 => style.heading2.copyWith(fontWeight: fontWeight);
  TextStyle get headline1 => style.headline1.copyWith(fontWeight: fontWeight);
  TextStyle get headline2 => style.headline2.copyWith(fontWeight: fontWeight);
  Label1 get label1 => Label1(style, fontWeight);
  TextStyle get label2 => style.label2.copyWith(fontWeight: fontWeight);
  TextStyle get caption1 => style.caption1.copyWith(fontWeight: fontWeight);
  TextStyle get caption2 => style.caption2.copyWith(fontWeight: fontWeight);

  //symple typography
  TextStyle get heading =>
      style.heading.copyWith(color: fontColor ?? defaultTextColor);
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
}

class Body1 {
  final TextStyleScheme style;
  final FontWeight? fontWeight;

  Body1(this.style, this.fontWeight);

  TextStyle get normal => style.body1Normal.copyWith(fontWeight: fontWeight);
  TextStyle get reading => style.body1Reading.copyWith(fontWeight: fontWeight);
}

class Body2 {
  final TextStyleScheme style;
  final FontWeight? fontWeight;

  Body2(this.style, this.fontWeight);

  TextStyle get normal => style.body2Normal.copyWith(fontWeight: fontWeight);
  TextStyle get reading => style.body2Reading.copyWith(fontWeight: fontWeight);
}

class Label1 {
  final TextStyleScheme style;
  final FontWeight? fontWeight;

  Label1(this.style, this.fontWeight);

  TextStyle get normal => style.label1Normal.copyWith(fontWeight: fontWeight);
  TextStyle get reading => style.label1Reading.copyWith(fontWeight: fontWeight);
}

class TextStyleScheme {
  TextStyle display1;
  TextStyle display2;
  TextStyle title1;
  TextStyle title2;
  TextStyle title3;
  TextStyle heading1;
  TextStyle heading2;
  TextStyle headline1;
  TextStyle headline2;
  TextStyle body1Normal;
  TextStyle body1Reading;
  TextStyle body2Normal;
  TextStyle body2Reading;
  TextStyle label1Normal;
  TextStyle label1Reading;
  TextStyle label2;
  TextStyle caption1;
  TextStyle caption2;

  TextStyle heading;
  TextStyle title;
  TextStyle subTitle;
  TextStyle body1;
  TextStyle body2;
  TextStyle caption;
  TextStyle undertext;

  TextStyleScheme({
    required this.display1,
    required this.display2,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.heading1,
    required this.heading2,
    required this.headline1,
    required this.headline2,
    required this.body1Normal,
    required this.body1Reading,
    required this.body2Normal,
    required this.body2Reading,
    required this.label1Normal,
    required this.label1Reading,
    required this.label2,
    required this.caption1,
    required this.caption2,
    required this.heading,
    required this.title,
    required this.subTitle,
    required this.body1,
    required this.body2,
    required this.caption,
    required this.undertext,
  });
}

final TextStyleScheme sympleTextStyle = TextStyleScheme(
  display1: const TextStyle(
    fontSize: 56,
    height: 72 / 56,
  ),
  display2: const TextStyle(
    fontSize: 40,
    height: 52 / 40,
  ),
  title1: const TextStyle(
    fontSize: 36,
    height: 48 / 36,
  ),
  title2: const TextStyle(
    fontSize: 28,
    height: 38 / 28,
  ),
  title3: const TextStyle(
    fontSize: 24,
    height: 32 / 24,
  ),
  heading1: const TextStyle(
    fontSize: 22,
    height: 30 / 22,
  ),
  heading2: const TextStyle(
    fontSize: 20,
    height: 28 / 20,
  ),
  headline1: const TextStyle(
    fontSize: 18,
    height: 26 / 18,
  ),
  headline2: const TextStyle(
    fontSize: 17,
    height: 24 / 17,
  ),
  body1Normal: const TextStyle(
    fontSize: 16,
    height: 24 / 16,
  ),
  body1Reading: const TextStyle(
    fontSize: 16,
    height: 26 / 16,
  ),
  body2Normal: const TextStyle(
    fontSize: 15,
    height: 22 / 15,
  ),
  body2Reading: const TextStyle(
    fontSize: 15,
    height: 24 / 15,
  ),
  label1Normal: const TextStyle(
    fontSize: 14,
    height: 20 / 14,
  ),
  label1Reading: const TextStyle(
    fontSize: 14,
    height: 22 / 14,
  ),
  label2: const TextStyle(
    fontSize: 13,
    height: 18 / 13,
  ),
  caption1: const TextStyle(
    fontSize: 12,
    height: 16 / 12,
  ),
  caption2: const TextStyle(
    fontSize: 11,
    height: 14 / 11,
  ),
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
);

// Define the text styles for each type
