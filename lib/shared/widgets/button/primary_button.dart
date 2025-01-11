import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool disable;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.backgroundColor,
    this.foregroundColor,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disable ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: disable
              ? ColorTheme.of(context).interaction.disable
              : backgroundColor ?? ColorTheme.of(context).primary.normal,
        ),
        child: Center(
          child: Text(
            label,
            style: CustomTextStyle.of(
              fontColor: disable
                  ? ColorTheme.of(context).label.assistive
                  : foregroundColor ?? ColorTheme.of(context).static.white,
            ).subTitle,
          ),
        ),
      ),
    );
  }
}
