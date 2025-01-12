import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Color(0xFFA4A4A4),
            child: Column(),
          ),
          Column(
            children: [
              Spacer(),
              SizedBox(height: 180),
              Container(
                width: double.infinity,
                height: 88,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFFFFF).withOpacity(0.3),
                    Color(0xFFFFFFFF).withOpacity(0.0)
                  ],
                )),
              ),
              Spacer(),
            ],
          ),
          Center(
              child: Column(
            children: [
              Spacer(),
              SizedBox(
                height: 80,
              ),
              Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/new/character/bbiyack.png")),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFF9601),
                    borderRadius: BorderRadius.circular(30)),
                width: 120,
                height: 52,
                child: Center(
                    child: Text(
                  "lv.1 - 삐약이",
                  style: CustomTextStyle.of(fontColor: Colors.white)
                      .heading
                      .mobile
                      .md,
                )),
              ),
              Spacer(),
            ],
          )),
          SafeArea(
            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("죄송합니다 ㅜㅜ"),
                                      content:
                                          Text("기능이 준비중입니다!!!ㅢ!ㅏ!ㅏ1ㅏ1ㅏ!!!."),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // 다이얼로그 닫기
                                            // 추가 작업 가능
                                          },
                                          child: Text("봐주기"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // 다이얼로그 닫기
                                            // 추가 작업 가능
                                          },
                                          child: Text("봐주기"),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Expanded(
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: Color(0xFFEAB308)
                                                  .withOpacity(0.16)),
                                          child: Text(
                                            "+20P",
                                            style: CustomTextStyle.of(
                                                    fontColor:
                                                        Color(0xFFCA8A04))
                                                .body
                                                .sm
                                                .semibold,
                                          ))),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/new/emoji/record.svg"),
                                        SizedBox(height: 4),
                                        Text(
                                          "기록하기",
                                          style: CustomTextStyle.of(
                                                  fontColor:
                                                      ColorTheme.of(context)
                                                          .static
                                                          .black
                                                          .withOpacity(0.8))
                                              .heading
                                              .mobile
                                              .md,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: VerticalDivider(width: 0),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("죄송합니다 ㅜㅜ"),
                                      content:
                                          Text("기능이 준비중입니다!!!ㅢ!ㅏ!ㅏ1ㅏ1ㅏ!!!."),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // 다이얼로그 닫기
                                            // 추가 작업 가능
                                          },
                                          child: Text("봐주기"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // 다이얼로그 닫기
                                            // 추가 작업 가능
                                          },
                                          child: Text("봐주기"),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Expanded(
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: Color(0xFFEAB308)
                                                  .withOpacity(0.16)),
                                          child: Text(
                                            "+20P",
                                            style: CustomTextStyle.of(
                                                    fontColor:
                                                        Color(0xFFCA8A04))
                                                .body
                                                .sm
                                                .semibold,
                                          ))),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/new/emoji/game.svg"),
                                        SizedBox(height: 4),
                                        Text(
                                          "퀘스트하기",
                                          style: CustomTextStyle.of(
                                                  fontColor:
                                                      ColorTheme.of(context)
                                                          .static
                                                          .black
                                                          .withOpacity(0.8))
                                              .heading
                                              .mobile
                                              .md,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Transform.translate(
              offset: Offset(0, -150),
              child: CustomPaint(
                painter: SpeechBubblePainter(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "수면이 필요해보여요.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        height: 44,
                        decoration: BoxDecoration(
                            color: Color(0xFFFF9601).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Spacer(),
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(8)),
                                  width: 80,
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  width: 40,
                                  height: 10,
                                ),
                              ],
                            ),
                            SizedBox(width: 8),
                            Text(
                              "40P 남음",
                              style: CustomTextStyle.of(fontColor: Colors.white)
                                  .body
                                  .lg
                                  .semibold,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      HomeFloatButton(
                        imageURL: "assets/new/emoji/settings.svg",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeFloatButton(
                        imageURL: "assets/new/emoji/halfmoon.svg",
                        text: "수면",
                      ),
                      HomeFloatButton(
                        imageURL: "assets/new/emoji/magic.svg",
                        text: "꾸미기",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeFloatButton(
                        imageURL: "assets/new/emoji/walk.svg",
                        text: "걸음 수",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeFloatButton(
                        imageURL: "assets/new/emoji/chart.svg",
                        text: "통계",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SpeechBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFFFFBDD)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(20, 0) // 좌상단 (둥글게 시작)
      ..arcToPoint(Offset(0, 20),
          radius: Radius.circular(20), clockwise: false) // 왼쪽 위 모서리
      ..lineTo(0, size.height - 20) // 왼쪽
      ..arcToPoint(Offset(20, size.height),
          radius: Radius.circular(20), clockwise: false) // 왼쪽 아래 모서리
      ..lineTo(size.width / 2 - 20, size.height) // 말풍선 삼각형 시작점
      ..lineTo(size.width / 2, size.height + 20) // 말풍선 삼각형 끝점
      ..lineTo(size.width / 2 + 20, size.height) // 말풍선 삼각형 두 번째 끝점
      ..lineTo(size.width - 20, size.height) // 오른쪽 아래
      ..arcToPoint(Offset(size.width, size.height - 20),
          radius: Radius.circular(20), clockwise: false) // 오른쪽 아래 모서리
      ..lineTo(size.width, 20) // 오른쪽 위
      ..arcToPoint(Offset(size.width - 20, 0),
          radius: Radius.circular(20), clockwise: false) // 오른쪽 위 모서리
      ..lineTo(10, 0) // 위로 이어지기
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HomeFloatButton extends StatelessWidget {
  const HomeFloatButton({super.key, required this.imageURL, this.text});
  final String imageURL;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("죄송합니다 ㅜㅜ"),
                content: Text("기능이 준비중입니다!!!ㅢ!ㅏ!ㅏ1ㅏ1ㅏ!!!."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                      // 추가 작업 가능
                    },
                    child: Text("봐주기"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                      // 추가 작업 가능
                    },
                    child: Text("봐주기"),
                  ),
                ],
              );
            });
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
              ),
              SvgPicture.asset(
                width: 32,
                height: 32,
                imageURL,
                fit: BoxFit.fill,
              ),
            ],
          ),
          if (text != null)
            Text(
              text ?? "",
              style:
                  CustomTextStyle.of(fontColor: Colors.black).body.md.semibold,
            )
        ],
      ),
    );
  }
}
