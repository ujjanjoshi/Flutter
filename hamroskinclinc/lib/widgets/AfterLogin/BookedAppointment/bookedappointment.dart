import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/Appointment/appointment.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';
import 'package:intl/intl.dart';

class BookedAppointment extends StatefulWidget {
  final String name;
  final String field;
  BookedAppointment(this.name, this.field);

  @override
  State<BookedAppointment> createState() => _BookedAppointmentState();
}

class _BookedAppointmentState extends State<BookedAppointment> {
  int experinces = 0;

  int experince() {
    if (widget.name == "Dr. Bikrant Dhakal") {
      experinces = 10;
    } else if (widget.name == "Dr. Merina Manandhar") {
      experinces = 15;
    } else if (widget.name == "Dr. Lalan Khatiwada") {
      experinces = 20;
    } else if (widget.name == "Prof. Dr. Anil Kumar Jha") {
      experinces = 25;
    } else {
      experinces = 30;
    }
    return experinces;
  }

  String dropdownvalue = 'Service Name';

  // List of items in our dropdown menu
  var items = [
    'Service Name',
    'Skin Biopsy',
    ' Skin Analyzer',
    'Narrow Band UVB Therapy',
    'Q-Switched NdYAG Laser',
  ];
  String dropdowntime = 'Time';
  var timeitems = [
    'Time',
    '10:00 am - 2:00 pm',
  ];
  Widget changd = Text(
    'Choose Date',
    style: TextStyle(
        color: Color(0xff6E7191),
        fontSize: 13,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400),
  );
  String doctorname = "";
  String time = "";
  String appdate = "";
  var data;
  var output;
  String url = "";
  void bookappotint() async {
    doctorname = widget.name;
    url = "http://192.168.0.101:1000/app/bookappointment?doctorname=" +
        doctorname +
        "&time=" +
        time +
        "&date=" +
        appdate;
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    setState(() {
      output = decoded['valid'];
      if (output) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Done!"),
                content: Text("Your request is send"),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pushNamed('MainMenuAfter');
                    },
                  ),
                ],
              );
            });
        // Navigator.of(context).pushNamed('Drappointmentafter');
      } else {
        // print('nooutput');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error!!"),
                content: Text("Required all valid data"),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop('BookedAppointment');
                    },
                  ),
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor Appointment',
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            height: 140,
            child: Card(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              color: Color(0xff4E4B66),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.field,
                          style: TextStyle(
                              color: Color(0xffA0A3BD),
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xffD9D9D9),
                      border: Border.all(color: Color(0xFFCDECEE)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            height: 70,
            child: Card(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Experinces:',
                    style: TextStyle(
                        color: Color(0xff4E4B66),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    experince().toString() + " Yrs",
                    style: TextStyle(
                      color: Color(0xff4E4B66),
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 300,
            margin: EdgeInsets.all(10),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text("Select",
                          style: TextStyle(
                            color: Color(0xff4E4B66),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ))),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xffD9D9D9),
                      border: Border.all(color: Color(0xFFCDECEE)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton(
                      value: dropdowntime,
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),

                      style: TextStyle(
                          color: Color(0xff6E7191),
                          fontSize: 13,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400),
                      icon: Container(
                          margin: EdgeInsets.fromLTRB(140, 0, 0, 0),
                          child: const Icon(Icons.keyboard_arrow_down)),
                      elevation: 16,
                      // Array list of items
                      items: timeitems.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValues) {
                        setState(() {
                          dropdowntime = newValues!;
                          time = dropdowntime;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xffD9D9D9),
                      border: Border.all(color: Color(0xFFCDECEE)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        changd,
                        TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2022, 00, 01),
                                maxTime: DateTime(2024, 00, 01),
                                onChanged: (date) {
                              print('change $date');
                            }, onConfirm: (date) {
                              setState(() {
                                changd = Text(
                                  DateFormat('yyyy/MM/dd').format(date),
                                  style: TextStyle(
                                      color: Color(0xff6E7191),
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400),
                                );
                                appdate = DateFormat('yyyy/MM/dd').format(date);
                              });
                              print('confirm $date');
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: Icon(
                            Icons.calendar_today,
                            size: 30,
                            color: Color(0xff6E7191),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              height: 60,
              padding: EdgeInsets.all(10),
              // width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xff2196F3),
                border: Border.all(color: Color(0xFF2196F3)),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextButton(
                  onPressed: () {
                    bookappotint();
                  },
                  child: Text(
                    'Request Appointment',
                    style: TextStyle(
                        color: Color(0xffF7F7FC),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  )))
        ],
      ),
    );
  }
}
