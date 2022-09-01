import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class AddPrescriptionWidget extends StatefulWidget {
  final String patientname;
  final String doctorname;
  final String datess;
  AddPrescriptionWidget(this.patientname, this.doctorname, this.datess);

  @override
  State<AddPrescriptionWidget> createState() => _AddPrescriptionWidgetState();
}

class _AddPrescriptionWidgetState extends State<AddPrescriptionWidget> {
  String url = "";
  String msg = "";
  String preptitle = "";
  var data;
  var output;
  void storeprescription() async {
    url = "http://192.168.0.101:12000/app/addprescription?doctorname=" +
        widget.doctorname +
        "&patientname=" +
        widget.patientname +
        "&dates=" +
        widget.datess +
        "&prescriptions=" +
        msg.toString() +
        "&prescriptiontitle=" +
        preptitle.toString();
    print(msg);
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    setState(() {
      output = decoded['list'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Prescriptions To : ' + widget.patientname,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w600),
      )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Card(
                elevation: 5,
                color: Color(0xffD9DBE9),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                            child: Text(
                              'Appointment Date:',
                              style: TextStyle(
                                color: Color(0xff6E7191),
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                            child: Text(
                              widget.datess,
                              style: TextStyle(
                                color: Color(0xff4E4B66),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                            child: Text(
                              'Prescrption For:',
                              style: TextStyle(
                                color: Color(0xff6E7191),
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: 170,
                            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: TextField(
                              onChanged: (value) {
                                preptitle = value;
                              },
                              decoration: InputDecoration(
                                  fillColor: Color(0xffFCFCFC),
                                  filled: true,
                                  hintText: 'Prescription for',
                                  hintStyle: TextStyle(
                                    color: Color(0xff6E7191),
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10))),
                              // maxLines: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Text(
                            'Prescription:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6E7191),
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: TextField(
                          onChanged: (value) {
                            msg = value;
                          },
                          decoration: InputDecoration(
                              fillColor: Color(0xffFCFCFC),
                              filled: true,
                              hintText: 'Prescription',
                              hintStyle: TextStyle(
                                color: Color(0xff6E7191),
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                          maxLines: 20,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xFF6E7191),
                                  border: Border.all(color: Color(0xFF6E7191)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Clear',
                                      style:
                                          TextStyle(color: Color(0xffFFFFFF)),
                                    ))),
                            Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xFF00BA88),
                                  border: Border.all(color: Color(0xFF00BA88)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      storeprescription();
                                      Navigator.of(context)
                                          .pushNamed('MainMenuDoctor');
                                    },
                                    child: Text(
                                      'Send',
                                      style:
                                          TextStyle(color: Color(0xffFFFFFF)),
                                    ))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
