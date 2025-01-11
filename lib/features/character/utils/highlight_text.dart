import 'package:flutter/material.dart';

List<TextSpan> highlightText(String fullText, String matchText) {
  final spans = <TextSpan>[];
  int start = 0;

  // 반복문으로 matchText를 검색하여 TextSpan 생성
  while (true) {
    final index = fullText.indexOf(matchText, start);
    if (index == -1) {
      // 남은 텍스트 추가
      spans.add(TextSpan(text: fullText.substring(start)));
      break;
    }

    // 일반 텍스트 추가
    if (index > start) {
      spans.add(TextSpan(text: fullText.substring(start, index)));
    }

    // 하이라이트 텍스트 추가
    spans.add(
      TextSpan(
        text: matchText,
        style: TextStyle(color: Colors.red),
      ),
    );

    start = index + matchText.length;
  }

  return spans;
}
