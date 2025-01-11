import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ChatgptProvider extends ChangeNotifier {
  Future<bool> isKoreanProfanity(String userInput) async {
    final apiKey = dotenv.get('SUPABASE_URL');
    final url = Uri.parse("https://api.openai.com/v1/chat/completions");

    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
    };

    final body = jsonEncode({
      "model": "gpt-4",
      "messages": [
        {"role": "system", "content": "당신은 한국어 비속어 필터링 전문가입니다."},
        {
          "role": "user",
          "content":
              "다음 문장이 비속어를 포함하고 있는지 확인해 주세요. 포함한다면 해당 비속어를 반환하고, 그렇지 않다면 빈 문자열을 반환해 주세요. 문장: $userInput"
        }
      ],
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final reply = data['choices'][0]['message']['content'].trim();
      return reply.toLowerCase() == 'true';
    } else {
      throw Exception("OpenAI API 요청 실패: ${response.statusCode}");
    }
  }
}
