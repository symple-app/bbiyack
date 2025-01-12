import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackerton_gdg/features/character/presentation/pages/counsel_result_page.dart';
import 'package:hackerton_gdg/features/character/utils/highlight_text.dart';
import 'package:hackerton_gdg/features/character/utils/response_text_nullable.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';
import 'package:hackerton_gdg/shared/models/mentor_model.dart';
import 'package:hackerton_gdg/shared/provider/mentor/mentor_provider.dart';
import 'package:hackerton_gdg/shared/services/chatgpt_service.dart';
import 'package:hackerton_gdg/shared/widgets/button/bottom_button.dart';

class CounselCharacterPage extends StatefulWidget {
  const CounselCharacterPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CounselCharacterPage());
  }

  @override
  _CounselCharacterPageState createState() => _CounselCharacterPageState();
}

class _CounselCharacterPageState extends State<CounselCharacterPage> {
  int currentIndex = 0;
  String _userInput = "";
  String _userResponseText = "";

  bool _isLoading = false;
  bool _hasResponse = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMentorNameOne = context.read<MentorProvider>().isMentorNameOne();
    Mentor selectedMentor = context.read<MentorProvider>().selectedMentor;

    return Scaffold(
      backgroundColor: Color(0xffDBDCDF),
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              selectedMentor.backgroundColor,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  isMentorNameOne
                      ? Transform.rotate(
                          angle: -0.1,
                          child: Image.asset(selectedMentor.characterAsset),
                        )
                      : Image.asset(selectedMentor.characterAsset),
                  SizedBox(width: 12),
                  Container(
                    constraints: BoxConstraints(
                      minWidth: 218,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8), // 배경 색상
                      borderRadius: BorderRadius.circular(16), // 모서리 둥글게
                      border: Border.all(
                          color: Colors.black.withValues(alpha: 0.12),
                          width: 1),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      _hasResponse
                          ? isResponseTextNullable(_userResponseText)
                              ? "잘하고있어 !"
                              : "이런 부분은 다시 생각해\n보는 게 좋을 것 같아 :)"
                          : selectedMentor.summaryText,
                      style: CustomTextStyle.of(
                        fontColor: Color(0xff000000).withValues(alpha: 0.8),
                      ).body.lg.semibold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              currentIndex == 4
                  ? CounselResultComponent(
                      userInputText: _userInput,
                      responseText: _userResponseText,
                    )
                  : Padding(
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
                          hintText:
                              "예시: 오늘 늦잠을 자서 삐약톤에 늦참했어요ㅜ", // 텍스트 필드 기본 값 (힌트)
                          hintStyle:
                              TextStyle(color: Colors.grey), // 힌트 텍스트 스타일
                        ),
                        style: TextStyle(
                            fontSize: 16, color: Colors.black), // 입력 텍스트 스타일
                        maxLines: 8, // 한 줄 입력
                        textAlign: TextAlign.start, // 텍스트 가운데 정렬
                        onChanged: (value) {
                          setState(() {
                            _userInput = value;
                          });
                        },
                      ),
                    ),
              Spacer(),
              BottomButton(
                isActive: !_isLoading,
                isLoading: _isLoading,
                title: "다음으로",
                color: selectedMentor.primaryColor,
                foregroundColor: selectedMentor.textColor ?? Colors.white,
                onTap: () async {
                  FocusScope.of(context).unfocus();

                  setState(() {
                    _isLoading = true;
                  });

                  if (_hasResponse) {
                    Navigator.push(
                      context,
                      CounselResultPage.route(),
                    );
                  }

                  String responseText = await checkKoreanProfanity(_userInput);

                  setState(() {
                    currentIndex = 4;
                    _userResponseText = responseText;
                    _hasResponse = true;
                    _isLoading = false;
                  });
                },
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
    Color backgroundColor =
        context.read<MentorProvider>().getProcessConnectRectBackgroundColor();
    Color activateColor =
        context.read<MentorProvider>().getProcessConnectRectActivateColor();

    double finalOffset = offset;

    return Transform.translate(
      offset: Offset(finalOffset, 0),
      child: Container(
        width: 24.0, // 원의 너비
        height: 24.0, // 원의 높이
        decoration: BoxDecoration(
          color: isOn ? activateColor : backgroundColor, // 원의 색상
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
    Color backgroundColor =
        context.read<MentorProvider>().getProcessConnectRectBackgroundColor();
    Color activateColor =
        context.read<MentorProvider>().getProcessConnectRectActivateColor();

    double finalOffset = offset;

    return Transform.translate(
      offset: Offset(finalOffset, 0),
      child: Container(
        width: 40.0, // 원의 너비
        height: 8.0, // 원의 높이
        decoration: BoxDecoration(
          color: isOn ? activateColor : backgroundColor,
        ),
      ),
    );
  }
}

class CounselResultComponent extends StatelessWidget {
  final String userInputText;
  final String responseText;

  const CounselResultComponent({
    super.key,
    required this.userInputText,
    required this.responseText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white, // 배경 색상
              borderRadius: BorderRadius.circular(16), // 모서리 둥글게
            ),
            padding: EdgeInsets.all(24),
            child: RichText(
              text: TextSpan(
                style: CustomTextStyle.of().heading.mobile.lg,
                children: highlightText(userInputText, responseText),
              ),
            ),
          ),
          SizedBox(height: 12),
          if (!isResponseTextNullable(responseText))
            Container(
              width: double.infinity, // 사각형 너비
              decoration: BoxDecoration(
                color: Colors.white, // 배경 색상
                borderRadius: BorderRadius.circular(16), // 모서리 둥글게
              ),
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "개선필요",
                    style: CustomTextStyle.of(
                      fontColor: Color(0xffEF4444),
                    ).body.md.semibold,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "[$responseText] 무슨 말이죠?\n다시 생각하세요.",
                    style: CustomTextStyle.of().body.lg.semibold,
                  ),
                ],
              ),
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
                    child: Text("1 / 1"),
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
