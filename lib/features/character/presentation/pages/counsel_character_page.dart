import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/shared/widgets/button/bottom_button.dart';

class CounselCharacterPage extends StatefulWidget {
  const CounselCharacterPage({Key? key}) : super(key: key);

  @override
  _CounselCharacterPageState createState() => _CounselCharacterPageState();
}

class _CounselCharacterPageState extends State<CounselCharacterPage> {
  String character = 'assets/new/character/one_ggio.png';
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDBDCDF),
        foregroundColor: ColorTheme.of(context).inverse.background,
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Stack(
            children: [
              Row(children: [
                ProcessCircleComponent(offset: 0, isOn: false),
                ProcessConnectRectComponent(
                    offset: -2, isOn: currentIndex >= 1),
                ProcessCircleComponent(offset: -4, isOn: false),
                ProcessConnectRectComponent(
                    offset: -6, isOn: currentIndex >= 2),
                ProcessCircleComponent(offset: -8, isOn: false),
                ProcessConnectRectComponent(
                    offset: -10, isOn: currentIndex >= 3),
                ProcessCircleComponent(offset: -12, isOn: false),
                ProcessConnectRectComponent(
                    offset: -14, isOn: currentIndex >= 4),
                ProcessCircleComponent(offset: -16, isOn: false),
              ]),
              // 진행
              Row(children: [
                if (currentIndex >= 0)
                  ProcessCircleComponent(offset: 0, isOn: currentIndex >= 0),
                if (currentIndex >= 1)
                  ProcessConnectRectComponent(
                      offset: -2, isOn: currentIndex >= 1),
                if (currentIndex >= 1)
                  ProcessCircleComponent(offset: -4, isOn: currentIndex >= 1),
                if (currentIndex >= 2)
                  ProcessConnectRectComponent(
                      offset: -6, isOn: currentIndex >= 2),
                if (currentIndex >= 2)
                  ProcessCircleComponent(offset: -8, isOn: currentIndex >= 2),
                if (currentIndex >= 3)
                  ProcessConnectRectComponent(
                      offset: -10, isOn: currentIndex >= 3),
                if (currentIndex >= 3)
                  ProcessCircleComponent(offset: -12, isOn: currentIndex >= 3),
                if (currentIndex >= 4)
                  ProcessConnectRectComponent(
                      offset: -14, isOn: currentIndex >= 4),
                if (currentIndex >= 4)
                  ProcessCircleComponent(offset: -16, isOn: currentIndex >= 4),
              ]),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFDBDCDF)),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  Transform.rotate(angle: -0.1, child: Image.asset(character)),
                  SizedBox(width: 12),
                  Container(
                    width: 200, // 사각형 너비
                    height: 100, // 사각형 높이
                    decoration: BoxDecoration(
                      color: Colors.white, // 배경 색상
                      borderRadius: BorderRadius.circular(16), // 모서리 둥글게
                    ),
                    child: Center(child: Text("오늘은 무슨 일이 있었니?\n구체적으로 말해봐~")),
                  ),
                  Spacer(),
                ],
              ),
              currentIndex == 5
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true, // 배경 색상을 활성화
                          fillColor: Colors.white, // 배경 색상
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 16), // 텍스트 패딩
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16), // 모서리 둥글게
                            borderSide: BorderSide.none, // 테두리 제거
                          ),
                          hintText: "해피해피해피", // 텍스트 필드 기본 값 (힌트)
                          hintStyle:
                              TextStyle(color: Colors.grey), // 힌트 텍스트 스타일
                        ),
                        style: TextStyle(
                            fontSize: 16, color: Colors.black), // 입력 텍스트 스타일
                        maxLines: 8, // 한 줄 입력
                        textAlign: TextAlign.start, // 텍스트 가운데 정렬
                      ),
                    )
                  : CounselResultComponent(),
              Spacer(),
              BottomButton(
                title: "다음으로",
                color: Color(0xFFFFB100),
                foregroundColor: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProcessCircleComponent extends StatelessWidget {
  const ProcessCircleComponent(
      {Key? key, required this.offset, required this.isOn})
      : super(key: key);
  final double offset;
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    double finalOffset = offset;

    return Transform.translate(
      offset: Offset(finalOffset, 0),
      child: Container(
        width: 24.0, // 원의 너비
        height: 24.0, // 원의 높이
        decoration: BoxDecoration(
          color: isOn ? Color(0xFFFFB100) : Colors.white, // 원의 색상
          shape: BoxShape.circle, // 원형으로 설정
        ),
      ),
    );
  }
}

class ProcessConnectRectComponent extends StatelessWidget {
  const ProcessConnectRectComponent(
      {Key? key, required this.offset, required this.isOn})
      : super(key: key);
  final double offset;
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    double finalOffset = offset;

    return Transform.translate(
      offset: Offset(finalOffset, 0),
      child: Container(
        width: 40.0, // 원의 너비
        height: 8.0, // 원의 높이
        decoration: BoxDecoration(
          color: isOn ? Color(0xFFFFB100) : Colors.white,
        ),
      ),
    );
  }
}

class CounselResultComponent extends StatelessWidget {
  const CounselResultComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity, // 사각형 너비
            height: 100, // 사각형 높이
            decoration: BoxDecoration(
              color: Colors.white, // 배경 색상
              borderRadius: BorderRadius.circular(16), // 모서리 둥글게
            ),
            child: Center(child: Text("해피해피해피")),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity, // 사각형 너비
            height: 132, // 사각형 높이
            decoration: BoxDecoration(
              color: Colors.white, // 배경 색상
              borderRadius: BorderRadius.circular(16), // 모서리 둥글게
            ),
            child: Center(child: Text("해피해피해피")),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white, // 원의 색상
                  shape: BoxShape.circle, // 원형으로 설정
                ),
                child: Center(
                  child: Icon(Icons.chevron_left),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  width: 68,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white, // 원의 색상
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Center(
                    child: Text("1 / 4"),
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white, // 원의 색상
                  shape: BoxShape.circle, // 원형으로 설정
                ),
                child: Center(
                  child: Icon(
                    Icons.chevron_right,
                  ),
                ),
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
