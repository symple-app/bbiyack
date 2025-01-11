import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';
import 'package:hackerton_gdg/shared/widgets/button/bottom_button.dart';

class SelectCharacterPage extends StatefulWidget {
  const SelectCharacterPage({Key? key}) : super(key: key);

  @override
  _SelectCharacterPageState createState() => _SelectCharacterPageState();
}

class _SelectCharacterPageState extends State<SelectCharacterPage> {
  int _currentIndex = 0;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> character = ["꼭끼오", "듀끼오", "트끼오"];
    List<String> imgText = ['one', 'du', 't'];

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 76),
          Center(
            child: Text(
              "고민을 털어놓을\n 끼오 스승을 골라주세요",
              style: CustomTextStyle.of(
                      fontColor: ColorTheme.of(context).label.normal)
                  .heading
                  .mobile
                  .xl2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 70),
          CarouselSlider(
            options: CarouselOptions(
              height: 340.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index; // 슬라이드 인덱스를 업데이트
                });
              },
            ),
            items: [0, 1, 2].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                      child: Image.asset(
                    'assets/new/character/${imgText[i]}_ggio_card.png',
                    fit: BoxFit.fitHeight,
                  ));
                },
              );
            }).toList(),
          ),
          Spacer(),
          Text("양옆으로 넘겨서 선택해주세요",
              style: CustomTextStyle.of(
                      fontColor:
                          ColorTheme.of(context).static.black.withOpacity(0.6))
                  .body
                  .mobile
                  .medium),
          SizedBox(height: 12),
          BottomButton(
            title: '${character[_currentIndex]}로 할래요',
          ),
        ],
      )),
    );
  }
}
