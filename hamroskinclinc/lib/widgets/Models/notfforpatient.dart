import 'package:flutter/foundation.dart';

class PaitentNotificationReq {
  final String doctorname;
  final String time;
  final String date;
  final String msg;
  final String msg1;

  PaitentNotificationReq({
    required this.doctorname,
    required this.time,
    required this.date,
    required this.msg,
    required this.msg1,
  });
}
