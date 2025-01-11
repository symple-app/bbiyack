import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackerton_gdg/global/themes/color_palette.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';
import 'package:hackerton_gdg/shared/widgets/button/primary_button.dart';

void showComingSoonToast() {
  Fluttertoast.showToast(
    msg: '해당 기능은 현재 준비중이에요',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: ColorPalette.coolNeutral50,
  );
}

Future<dynamic> asdf(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorTheme.of(context).background.normalNormal,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 4,
                width: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorTheme.of(context).line.normal,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "맞춤형 프로그램/미션을 시작하려면\n검사 결과가 필요해요",
              style: CustomTextStyle.of(
                fontColor: ColorTheme.of(context).label.normal,
              ).title,
            ),
            const SizedBox(height: 8),
            Text(
              "5분만 투자하면, asdf님의 마음에 대해\n더 알아볼 수 있어요",
              style: CustomTextStyle.of(
                fontColor: ColorTheme.of(context).label.alternative,
              ).body2,
            ),
            const SizedBox(height: 16),
            Center(
              child: SvgPicture.asset(
                'assets/new/emoji/u1F4D1.svg',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: "검사 시작하기",
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    },
  );
}
