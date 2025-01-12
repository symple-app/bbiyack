bool isResponseTextNullable(String responseText) {
  if (responseText == "" ||
      responseText == '""' ||
      responseText == '"' ||
      responseText == "''" ||
      responseText.contains('빈 문자열')) {
    return true;
  }

  return false;
}
