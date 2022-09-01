import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/DoctorLogin/Acpp&Rejectnotif/acppnotf.dart';
import 'package:hamroskinclinc/widgets/Models/notfireq.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class DoctorsideNotification extends StatefulWidget {
  const DoctorsideNotification({Key? key}) : super(key: key);

  @override
  State<DoctorsideNotification> createState() => _DoctorsideNotificationState();
}

class _DoctorsideNotificationState extends State<DoctorsideNotification> {
  String url = "";
  var data;
  var output;
  var output2;
  Widget w = Text("No more message!!");

  // void initState() {
  //   setState(() {
  //     getnotify(context);
  //   });

  //   super.initState();
  // }

  void getnotify() async {
    url = "http://192.168.0.101:8000/app/notifydoctor";
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    List<DoctorNotificationReq> patientNotification = [];
    String names = "";
    String dates = "";
    String times = "";
    setState(() {
      output = decoded['list'];
      // output2 = decoded['finalmessage'];
      // print(output2);
      if (output == "nomore") {
        w = Text("No more message !!");
      } else {
        for (int i = 0; i < output.length; i++) {
          print(i);
          for (int j = 0; j < 3; j++) {
            names = output[i][0].toString();
            dates = output[i][1].toString();
            times = output[i][2].toString();
          }
          print(names + dates + times);
          patientNotification.add(DoctorNotificationReq(
              patientname: names, time: times, date: dates));
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
                          tx.patientname,
                          style: TextStyle(
                              color: Color(0xff14142B),
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        Text(
                          'Requested appointment:',
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: 90,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xFF04987D),
                                  border: Border.all(color: Color(0xFF04987D)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      AccptNotf.accptnotf(
                                          "accept",
                                          tx.patientname,
                                          tx.date,
                                          tx.time,
                                          getnotify);
                                    },
                                    child: Text(
                                      'Accept',
                                      style: TextStyle(
                                          color: Color(0xffFCFCFC),
                                          fontFamily: 'Poppins',
                                          fontSize: 14),
                                    ))),
                            Container(
                                width: 90,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xFFA0A3BD),
                                  border: Border.all(color: Color(0xFFA0A3BD)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      AccptNotf.accptnotf(
                                          "Reject",
                                          tx.patientname,
                                          tx.date,
                                          tx.time,
                                          getnotify);
                                    },
                                    child: Text(
                                      'Reject',
                                      style: TextStyle(
                                          color: Color(0xffFCFCFC),
                                          fontFamily: 'Poppins',
                                          fontSize: 14),
                                    ))),
                          ],
                        )
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
                    getnotify();
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
