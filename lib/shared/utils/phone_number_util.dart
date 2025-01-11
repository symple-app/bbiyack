import 'package:flutter/services.dart';

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;
    final oldText = oldValue.text;

    if (newText.length == 14) {
      return oldValue;
    }

    List<String> masks = ['xxx-xxxx-xxxx'];
    String separator = '-';

    if (newText.isEmpty || newText.length < oldText.length) {
      return newValue;
    }

    final pasted =
        (newText.length - oldText.length).abs() > 1; // 2자 이상 붙여넣기 하였는지?
    final mask = masks.firstWhere((value) {
      final maskValue = pasted
          ? value.replaceAll(separator, '')
          : value; // 여러개 중에 어떤 mask 를 사용할 것인지?
      return newText.length <= maskValue.length;
    });

    if (mask.isEmpty) {
      return oldValue;
    }

    if (newText.length < mask.length && mask[newText.length - 1] == separator) {
      final text = '$oldText$separator${newText.substring(newText.length - 1)}';
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(
          offset: text.length,
        ),
      );
    }

    return newValue;
  }
}

String convertPhoneNumber(String phoneNumber) {
  String cleanedNumber = phoneNumber.replaceAll("-", "");

  if (cleanedNumber.startsWith("0")) {
    cleanedNumber = '+82${cleanedNumber.substring(1)}';
  }
  return cleanedNumber;
}
