import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/Models/getmsgp.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class DoctorMessage extends StatefulWidget {
  final Function getMessageName;
  DoctorMessage(this.getMessageName);
  @override
  State<DoctorMessage> createState() => _DoctorMessageState();
}

class _DoctorMessageState extends State<DoctorMessage> {
  String url = "";
  var data;
  var output;
  var output2;
  Widget w = Text("No more message!!");
  void initState() {
    setState(() {
      getmessagerply(context);
    });

    super.initState();
  }

  void getmessagerply(BuildContext context) async {
    url = "http://192.168.0.101:20000/app/doctorsidemsg";
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    List<DoctorsMessages> patientMessage = [];
    String doctornamessss = "";

    setState(() {
      output = decoded['name'];
      print(output);
      for (int i = 0; i < output.length; i++) {
        print(i);
        for (int j = 0; j < 1; j++) {
          doctornamessss = output[i][0].toString();
        }
        patientMessage.add(DoctorsMessages(doctornamesss: doctornamessss));
      }
      w = Column(
        children: patientMessage.map((tx) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              tx.doctornamesss,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            widget.getMessageName(tx.doctornamesss);
                            Navigator.of(context).pushNamed('Messagerply');
                          },
                          child: Icon(Icons.message)),
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
                  getmessagerply(context);
                },
                child: Icon(Icons.refresh))
          ],
        ),
      ),
      backgroundColor: Color(0xffF7F7FC),
      appBar: AppBar(
        backgroundColor: Color(0xff2196F3),
        title: Container(
            margin: EdgeInsets.only(left: 70), child: Text("Message")),
      ),
      body: Column(
        children: [
          // w,
          Container(
            // height: 105,
            margin: EdgeInsets.all(10),
            child: w,
          ),
        ],
      ),
    );
  }
}
