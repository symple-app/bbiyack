import 'package:intl/intl.dart';

bool isCurrentMonth(DateTime datetime) {
  DateTime now = DateTime.now();

  if (datetime.year == now.year && datetime.month == now.month) {
    return true;
  }

  return false;
}

bool isEqualDateTime(DateTime firstDateTime, DateTime secondDateTime,
    {bool? exceptDay}) {
  if (firstDateTime.year == secondDateTime.year &&
      firstDateTime.month == secondDateTime.month &&
      (exceptDay ?? firstDateTime.day == secondDateTime.day)) {
    return true;
  }
  return false;
}

/// @ YYYY년 MM월 DD일
String datetimeToStringForYmd(DateTime datetime) {
  return "${datetime.year}년 ${datetime.month}월 ${datetime.day}일";
}

/// @ MM월 DD일
String datetimeToStringForMd(DateTime datetime) {
  return "${datetime.month}월 ${datetime.day}일";
}

/// @ 인자값 datetime에 hour, minute, second가 있는지 확인
///
/// ex) for default, 00:00:00
bool checkTimeExistInDateTime(DateTime datetime) {
  int hour = datetime.hour;
  int minute = datetime.minute;
  int second = datetime.second;

  if (hour != 0 && minute != 0 && second != 0) return true;

  return false;
}

DateTime selectMinimumDateTime(DateTime first, DateTime? second) {
  if (second == null) {
    return first;
  }

  if (first.isBefore(second)) {
    return first;
  } else {
    return second;
  }
}

DateTime selectMaximumDateTime(DateTime first, DateTime? second) {
  if (second == null) {
    return first;
  }

  if (first.isAfter(second)) {
    return first;
  } else {
    return second;
  }
}

String dateTimeToDDayString(DateTime datetime) {
  int diffDays = datetime.difference(DateTime.now()).inDays;

  if (diffDays >= 0) {
    return "D-$diffDays";
  } else {
    return "D+$diffDays";
  }
}

String? dateTimeToString(DateTime? datetime) =>
    datetime != null ? DateFormat("yyyy-MM-dd").format(datetime) : null;

String convertWeekdayToString(int weekday) {
  switch (weekday) {
    case 1:
      return '월';
    case 2:
      return '화';
    case 3:
      return '수';
    case 4:
      return '목';
    case 5:
      return '금';
    case 6:
      return '토';
    case 7:
      return '일';

    default:
      return '';
  }
}

String formatDateTime(DateTime dateTime) {
  // 시간을 12시간제로 변환
  String period = dateTime.hour >= 12 ? "오후" : "오전";
  int hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12; // 12시간 형식
  String minute = DateFormat('mm').format(dateTime); // 분만 포맷

  return "$period $hour시 $minute분";
}

/// 현재 @date 월의 총 일 수를 반환 (ex 30, 31...)
int daysInMonth(DateTime date) {
  // 다음 달의 첫 번째 날짜에서 하루를 빼기
  var firstDayNextMonth = (date.month < 12)
      ? DateTime(date.year, date.month + 1, 1)
      : DateTime(date.year + 1, 1, 1);

  return firstDayNextMonth.subtract(const Duration(days: 1)).day;
}
