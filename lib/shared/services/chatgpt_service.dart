import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> checkKoreanProfanity(String userInput) async {
  final apiKey = dotenv.get('SYMPLE_OPEN_AI_API_KEY');
  final url = Uri.parse("https://api.openai.com/v1/chat/completions");

  final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $apiKey",
  };

  final body = jsonEncode({
    "model": "gpt-4",
    "messages": [
      {
        "role": "system",
        "content": "당신은 한국어 비속어 필터링 전문가입니다.",
      },
      {
        "role": "user",
        "content":
            "다음 문장에서 비속어면서 욕인 단어를 찾아내어 비속어인 단어들만 골라서 반환해주세요. 만약 비속어가 여러 개라면 쉼표(,)로 구분하여 반환해주세요. 비속어가 없다면 빈 문자열을 반환하세요. 문장: $userInput"
      }
    ],
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    final decodedResponse = utf8.decode(response.bodyBytes);
    final data = jsonDecode(decodedResponse);
    final rawReply = data['choices'][0]['message']['content'].trim();

    if (rawReply == "") {
      return "";
    } else {
      return rawReply;
    }
  } else {
    print("Error: ${response.statusCode}, ${response.body}");
    throw Exception("OpenAI API 요청 실패: ${response.statusCode}");
  }
}
