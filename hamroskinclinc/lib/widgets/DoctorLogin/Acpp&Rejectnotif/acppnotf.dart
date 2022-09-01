import 'dart:convert';

import 'package:hamroskinclinc/widgets/DoctorLogin/Notification/notification.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class AccptNotf {
  static String url = "";
  static var data;
  static var output;
  static void accptnotf(String changedec, String name, String date, String time,
      Function getnotify) async {
    url = "http://192.168.0.101:9000//app/bookaccpet?doctorname=" +
        name +
        "&time=" +
        time +
        "&date=" +
        date +
        "&changedec=" +
        changedec;
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    output = decoded['valid'];
    print(output);
    if (output) {
      getnotify();
    }
    // return 'your app has been fixed';
  }
}
