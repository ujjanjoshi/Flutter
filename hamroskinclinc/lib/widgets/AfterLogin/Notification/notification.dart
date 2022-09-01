import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/Models/notfforpatient.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class PatientssideNotification extends StatefulWidget {
  @override
  State<PatientssideNotification> createState() =>
      _PatientssideNotificationState();
}

class _PatientssideNotificationState extends State<PatientssideNotification> {
  String url = "";
  var data;
  var output;
  var output2;
  Widget w = Text("No more message!!");
  void initState() {
    setState(() {
      getnotify(context);
    });

    super.initState();
  }

  void getnotify(BuildContext context) async {
    url = "http://192.168.0.101:10000/app/notifypatient";
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    List<PaitentNotificationReq> patientNotification = [];
    String names = "";
    String dates = "";
    String times = "";
    String msg = "";
    String msg2 = "";
    String status = "";
    setState(() {
      output = decoded['list'];
      if (output == "nomore") {
        w = Text("No more message !!");
      } else {
        for (int i = 0; i < output.length; i++) {
          print(i);
          for (int j = 0; j < 4; j++) {
            names = output[i][0].toString();
            dates = output[i][1].toString();
            times = output[i][2].toString();
            status = output[i][3].toString();
            if (status == "accepted") {
              msg = "You requested has been accepted!!!";
              msg2 = "Requested Accepted";
            } else {
              msg = "You requested has been rejected!!!";
              msg2 = "";
            }
          }
          print(names + dates + times);
          patientNotification.add(PaitentNotificationReq(
              doctorname: names,
              time: times,
              date: dates,
              msg: msg,
              msg1: msg2));
        }
        w = Column(
          children: patientNotification.map((tx) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 800,
                  // height: 150,
                  margin: EdgeInsets.all(5),
                  child: Card(
                      child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.msg,
                          style: TextStyle(
                              color: Color(0xff14142B),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          tx.doctorname,
                          style: TextStyle(
                              color: Color(0xff14142B),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          tx.msg1,
                          style: TextStyle(
                              color: Color(0xff6E7191),
                              fontFamily: 'Poppins',
                              fontSize: 14),
                        ),
                        Text(
                          "Date: " + tx.date,
                          style: TextStyle(
                              color: Color(0xff6E7191),
                              fontFamily: 'Poppins',
                              fontSize: 14),
                        ),
                        Text(
                          "Time: " + tx.time,
                          style: TextStyle(
                              color: Color(0xff6E7191),
                              fontFamily: 'Poppins',
                              fontSize: 14),
                        ),
                      ],
                    ),
                  )),
                ),
              ],
            );
          }).toList(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          // width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    getnotify(context);
                  },
                  child: Icon(Icons.refresh))
            ],
          ),
        ),
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(left: 40),
            child: Text(
              'Notification',
              style: TextStyle(
                color: Color(0xffF7F7FC),
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [
                w,
              ],
            ),
          ),
        ));
  }
}
