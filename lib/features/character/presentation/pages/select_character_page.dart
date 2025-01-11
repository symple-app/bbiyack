import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackerton_gdg/shared/models/mentor_model.dart';
import 'package:hackerton_gdg/shared/provider/mentor_provider.dart';
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
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 72),
          Text("고민을 털어놓을 끼오 스승을 골라주세요"),
          Spacer(),
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
            items: mentorList.map((mentor) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                      child: Image.asset(
                    'assets/new/character/${mentor.assetName}_ggio_card.png',
                    fit: BoxFit.fitHeight,
                  ));
                },
              );
            }).toList(),
          ),
          Spacer(),
          Text("양옆으로 넘겨서 선택해주세요"),
          SizedBox(height: 12),
          BottomButton(
            title: '${mentorList[_currentIndex].name}로 할래요',
            onTap: () {
              context
                  .read<MentorProvider>()
                  .selectMentor(mentorList[_currentIndex]);
            },
          ),
        ],
      )),
    );
  }
}
