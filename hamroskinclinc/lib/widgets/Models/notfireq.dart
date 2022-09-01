import 'package:flutter/foundation.dart';

class DoctorNotificationReq {
  final String patientname;
  final String time;
  final String date;

  DoctorNotificationReq({
    required this.patientname,
    required this.time,
    required this.date,
  });
}
