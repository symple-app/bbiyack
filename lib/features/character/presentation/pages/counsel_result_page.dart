import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';

class CounselResultPage extends StatefulWidget {
  const CounselResultPage({Key? key}) : super(key: key);

  @override
  _CounselResultPageState createState() => _CounselResultPageState();
}

class _CounselResultPageState extends State<CounselResultPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // 화면의 가로 길이를 가져옴

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDBDCDF),
        foregroundColor: ColorTheme.of(context).inverse.background,
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFDBDCDF)),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 16),
            Center(
              child: Text(
                "삐약이의 애정도가\n20P 증가했어요!",
                style: CustomTextStyle.of(
                        fontColor: ColorTheme.of(context).label.normal)
                    .heading
                    .mobile
                    .xl2,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "퀘스트를 진행하면 \n포인트를 더 받을 수 있어요",
              textAlign: TextAlign.center,
              style:
                  CustomTextStyle.of(fontColor: Colors.black.withOpacity(0.6))
                      .body
                      .lg
                      .regular,
            ),
            SizedBox(height: 16),
            Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xFFFBE56D),
                    Color(0xFFFBE56D).withOpacity(0.0)
                  ],
                  stops: [0.0, 1.0], // 0.5에서 중앙 색, 1.0에서 바깥으로 옅어짐
                ),
              ),
              child: Image.asset(
                "assets/new/character/bbiyack.png",
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ColorTheme.of(context).static.white,
                        ),
                        child: Center(
                          child: Text(
                            "다음에 하기",
                            style: CustomTextStyle.of(
                              fontColor:
                                  ColorTheme.of(context).inverse.background,
                            ).subTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 7.5),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xFFFFB100),
                        ),
                        child: Center(
                          child: Text(
                            "퀘스트하기",
                            style: CustomTextStyle.of(
                              fontColor: ColorTheme.of(context).static.black,
                            ).subTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
