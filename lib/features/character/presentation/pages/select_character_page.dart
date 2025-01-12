import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hackerton_gdg/features/character/presentation/pages/counsel_character_page.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackerton_gdg/shared/models/mentor_model.dart';
import 'package:hackerton_gdg/shared/provider/mentor/mentor_provider.dart';
import 'package:hackerton_gdg/shared/widgets/button/bottom_button.dart';

class SelectCharacterPage extends StatefulWidget {
  const SelectCharacterPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SelectCharacterPage());
  }

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
    List<Mentor> mentorList = context.read<MentorProvider>().mentorList;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 40),
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
              height: 300.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index; // 슬라이드 인덱스를 업데이트
                });
              },
            ),
            items: mentorList.map((mentor) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    child: Image.asset(
                      'assets/new/character/${mentor.cardAsset}_ggio_card.png',
                      fit: BoxFit.fitHeight,
                    ),
                  );
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
                  .lg
                  .medium),
          SizedBox(height: 12),
          BottomButton(
            title: '${mentorList[_currentIndex].name}로 할래요',
            color: mentorList[_currentIndex].primaryColor,
            foregroundColor:
                mentorList[_currentIndex].textColor ?? Colors.white,
            onTap: () {
              context
                  .read<MentorProvider>()
                  .selectMentor(mentorList[_currentIndex]);

              Navigator.push(context, CounselCharacterPage.route());
            },
          ),
        ],
      )),
    );
  }
}
