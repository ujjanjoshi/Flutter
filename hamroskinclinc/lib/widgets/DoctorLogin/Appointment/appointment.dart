import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/Models/getappdetails.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class PatientAppointment extends StatefulWidget {
  final Function getappname;
  PatientAppointment(this.getappname);
  @override
  State<PatientAppointment> createState() => _PatientAppointmentState();
}

class _PatientAppointmentState extends State<PatientAppointment> {
  String url = "";
  var data;
  var output;
  var doctorname;
  Widget w = Text("No Schedule!!");
  void initState() {
    setState(() {
      getpatientappnt(context);
    });

    super.initState();
  }

  void getpatientappnt(BuildContext context) async {
    url = "http://192.168.0.101:11000/app/appointmentschedule";
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    List<Appointmentdetails> patientNotification = [];
    String names = "";
    String dates = "";
    String times = "";
    setState(() {
      output = decoded['list'];
      doctorname = decoded['doctorname'];
      if (output == "nomore") {
        w = Text("No Schedule !!");
      } else {
        for (int i = 0; i < output.length; i++) {
          print(i);
          for (int j = 0; j < 3; j++) {
            names = output[i][0].toString();
            times = output[i][1].toString();
            dates = output[i][2].toString();
          }
          print(names + dates + times);
          patientNotification.add(
              Appointmentdetails(patientname: names, time: times, date: dates));
        }
        w = Column(
          children: patientNotification.map((tx) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 105,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xffD9D9D9),
                            border: Border.all(color: Color(0xFFCDECEE)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 60,
                          height: 60,
                          child: Icon(Icons.person),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 1, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tx.patientname,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Date: " + tx.date,
                                style: TextStyle(
                                    color: Color(0xff6E7191),
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Time: " + tx.time,
                                style: TextStyle(
                                    color: Color(0xff6E7191),
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              widget.getappname(
                                  tx.patientname, doctorname, tx.date);
                              Navigator.of(context)
                                  .pushNamed('AddPrescriptionWidget');
                            },
                            child: Icon(Icons.medication)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                    getpatientappnt(context);
                    // getnotify();
                  },
                  child: Icon(Icons.refresh))
            ],
          ),
        ),
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Appointment Schedule',
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
            child: Column(children: [
              w,
            ]),
          ),
        ));
  }
}
