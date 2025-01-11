import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_palette.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';

Color phychologyTagToColor(BuildContext context, String value) {
  switch (value) {
    case "Lime":
      return ColorTheme.of(context).accent.lime;

    case "violet":
      return ColorTheme.of(context).accent.violet;

    case "redOrange":
      return ColorTheme.of(context).accent.redOrange;

    case "lightBlue":
      return ColorTheme.of(context).accent.lightBlue;

    case "negative":
      return ColorTheme.of(context).status.destructive;

    case "blue":
      return ColorPalette.blue50;

    default:
      return ColorTheme.of(context).accent.lightBlue;
  }
}
