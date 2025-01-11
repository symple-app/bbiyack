import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool isActive;
  final bool isLoading;

  const BottomButton({
    super.key,
    required this.title,
    this.onTap,
    this.isActive = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive && !isLoading ? onTap : null,
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isActive
                ? ColorTheme.of(context).primary.normal
                : ColorTheme.of(context).interaction.disable,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: ColorTheme.of(context).inverse.label,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    title,
                    style: CustomTextStyle.of(
                      fontColor: ColorTheme.of(context).static.white,
                    ).subTitle,
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }
}
