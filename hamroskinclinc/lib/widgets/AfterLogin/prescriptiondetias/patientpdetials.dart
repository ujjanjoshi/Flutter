import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/Models/getpresdrpdetials.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class PrescriptionDetailsPatients extends StatefulWidget {
  const PrescriptionDetailsPatients({Key? key}) : super(key: key);

  @override
  State<PrescriptionDetailsPatients> createState() =>
      _PrescriptionDetailsPatientsState();
}

class _PrescriptionDetailsPatientsState
    extends State<PrescriptionDetailsPatients> {
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
    url = "http://192.168.0.101:15000/app/prescriptiondetialspatient";
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    List<Pescriptiondetails> patientNotification = [];
    String ptitle = "";
    String pmsg = "";
    String times = "";
    setState(() {
      output = decoded['list'];
      for (int i = 0; i < output.length; i++) {
        print(i);
        for (int j = 0; j < 3; j++) {
          times = output[i][0].toString();
          ptitle = output[i][1].toString();
          pmsg = output[i][2].toString();
        }
        patientNotification
            .add(Pescriptiondetails(ptitle: ptitle, pmsg: pmsg, time: times));
      }
      w = Column(
        children: patientNotification.map((tx) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 130,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Appointment date: " + tx.time,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff4E4B66),
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        tx.ptitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff4E4B66),
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          tx.pmsg,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                          ),
                        ),
                      ),
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
                    getpatientappnt(context);
                    // getnotify();
                  },
                  child: Icon(Icons.refresh))
            ],
          ),
        ),
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(left: 40),
            child: Text(
              'Prescription',
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
