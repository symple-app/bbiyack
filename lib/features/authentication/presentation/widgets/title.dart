import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';

class SignUpTitle extends StatelessWidget {
  final String title;
  final String? subTitle;

  const SignUpTitle({
    super.key,
    required this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: ColorTheme.of(context).label.neutral,
          ),
        ),
        if (subTitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subTitle ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: ColorTheme.of(context).label.alternative,
            ),
          ),
        ]
      ],
    );
  }
}
