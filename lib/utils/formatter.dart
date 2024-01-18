import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

int fromStringToWeekday(String weekdayStr) {
  switch (weekdayStr) {
    case 'Monday':
    case '一':
      return 1;
    case 'Tuesday':
    case '二':
      return 2;
    case 'Wednesday':
    case '三':
      return 3;
    case 'Thursday':
    case '四':
      return 4;
    case 'Friday':
    case '五':
      return 5;
    case 'Saturday':
    case '六':
      return 6;
    case 'Sunday':
    case '日':
      return 7;
    default:
      return 0;
  }
}

bool checkOneOfTimeIsExpired(List<bool> expireds) {
  List<bool> timesAreNotExpired = List.filled(expireds.length, false);
  return !listEquals(timesAreNotExpired, expireds);
}

bool isTimeAfterNow(DateTime time) {
  final currentT = DateTime.now();
  //debugPrint("currentT: ${currentT.toString()}");
  return time.isAfter(currentT);
}

DateTime convertSelectTime(DateTime dateTime) {
  if (!isTimeAfterNow(dateTime)) {
    return dateTime.add(const Duration(days: 1));
  }
  return dateTime;
}

String fromTimeToDateString(DateTime time) {
  return '${time.year}/${time.month}/${time.day}';
}

String fromSameDayTimeToString(
  DateTime time, {
  List<String>? dateTxts,
}) {
  String timeStr = '${hTOhh_24hTrue(time.hour)}:${mTOmm(time.minute)}';
  if (dateTxts != null && dateTxts.isNotEmpty) {
    if (!isTimeAfterNow(time) && dateTxts.length >= 3) {
      return '$timeStr ${dateTxts[2]}';
    }
  }
  return timeStr;
}

String fromTimeToString(DateTime time,
    {List? weekdays, List<String>? dateTxts, bool longFormat = false}) {
  String timeStr = '${hTOhh_24hTrue(time.hour)}:${mTOmm(time.minute)}';
  if (weekdays != null) {
    if (weekdays.isEmpty) {
      if (dateTxts != null && dateTxts.isNotEmpty) {
        return _showTimeWthdateTxt(time, timeStr, dateTxts, longFormat);
      }
      return '${fromTimeToDateString(time)}\n$timeStr';
    }
  }
  return timeStr;
}

String _showTimeWthdateTxt(
    DateTime time, String timeStr, List<String> dateTxts, bool longFormat) {
  final currentT = DateTime.now();

  if (longFormat) {
    if (isTimeAfterNow(time)) {
      if (currentT.day == time.day) {
        // tdy
        return '${fromTimeToDateString(time)}\n${dateTxts[0]} $timeStr';
      }
      // tmr
      return '${fromTimeToDateString(time)}\n${dateTxts[1]} $timeStr';
    } else {
      // expired
      if (dateTxts.length >= 3) {
        return '${fromTimeToDateString(time)}\n$timeStr ${dateTxts[2]}';
      }
      return '${fromTimeToDateString(time)} $timeStr';
    }
  } else {
    if (isTimeAfterNow(time)) {
      if (currentT.day == time.day) {
        // tdy
        return '${dateTxts[0]} $timeStr';
      }
      // tmr
      return '${dateTxts[1]} $timeStr';
    } else {
      // expired
      if (dateTxts.length >= 3) {
        return '$timeStr ${dateTxts[2]}';
      }
      return timeStr;
    }
  }
}

String fromTimeOfDayToString(TimeOfDay time, {List? weekdays}) {
  return '${hTOhh_24hTrue(time.hour)}:${mTOmm(time.minute)}';
}

String hTOhh_24hTrue(int hour) {
  late String sHour;
  if (hour < 10) {
    sHour = '0$hour';
  } else {
    sHour = '$hour';
  }
  return sHour;
}

List<String> hTOhh_24hFalse(int hour) {
  late String sHour;
  late String h12State;
  final times = <String>[];
  if (hour < 10) {
    sHour = '0$hour';
    h12State = 'AM';
  } else if (hour > 9 && hour < 13) {
    sHour = '$hour';
    h12State = 'AM';
  } else if (hour > 12 && hour < 22) {
    sHour = '0${hour % 12}';
    h12State = 'PM';
  } else if (hour > 21) {
    sHour = '${hour % 12}';
    h12State = 'PM';
  }
  times.add(sHour);
  times.add(h12State);
  return times;
}

String mTOmm(int minute) {
  late String sMinute;
  if (minute < 10) {
    sMinute = '0$minute';
  } else {
    sMinute = '$minute';
  }
  return sMinute;
}