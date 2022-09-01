import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/Models/storemsgpatient.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class Messagereply extends StatefulWidget {
  final String msgname;
  Messagereply(this.msgname);

  @override
  State<Messagereply> createState() => _MessagereplyState();
}

class _MessagereplyState extends State<Messagereply> {
  Widget w = Text('');
  String txt = "";
  String updatemsg = "";
  final fieldText = TextEditingController();
  String url = "";
  var data;
  var output;
  var output2;
  // Widget w = Text("No more message!!");
  void clearText() {
    fieldText.clear();
  }

  void initState() {
    setState(() {
      sendmessage(context);
    });

    super.initState();
  }

  void sendmessage(BuildContext context) async {
    url = "http://192.168.0.101:19000//app/patientsidemsgstore?doctorname=" +
        widget.msgname +
        "&updatemsg=" +
        updatemsg;
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    String sendby = "";
    // output = decoded['msg'];
    List<StorePatientsMessages> patientMessage = [];
    String mssg = "";
    setState(() {
      output = decoded['msg'];
      print(output);
      for (int i = 0; i < output.length; i++) {
        print(i);
        for (int j = 0; j < 2; j++) {
          mssg = output[i][0].toString();
          sendby = output[i][1].toString();
        }
        patientMessage.add(StorePatientsMessages(mssage: mssg, sendby: sendby));
      }
      w = Column(
        children: patientMessage.map((tx) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      tx.sendby,
                      style: TextStyle(
                        color: Color(0xff6E7191),
                        fontFamily: 'Poppins',
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Container(
                      // width: 150,
                      height: 50,
                      child: Card(
                          elevation: 5,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Text(
                              tx.mssage,
                              style: TextStyle(
                                color: Color(0xff4E4B66),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ))),
                ],
              ),
            ),
          );
        }).toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(25, 0, 22, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                  border: Border.all(color: Color(0xFF4E4B66)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                        width: 260,
                        height: 55,
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
                              hintText: 'Type your message...',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(0))),
                          controller: fieldText,
                          onChanged: (value) {
                            updatemsg = value;
                          },
                        )),
                    Container(
                      // width: 45,
                      // height: 40,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      // padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFF2196F3),
                        border: Border.all(color: Color(0xFF2196F3)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              clearText();
                              // rply.add(txt);
                              sendmessage(context);
                              // w = Text(txt);
                            });
                          },
                          child: Icon(
                            Icons.send,
                            color: Color(0xffF7F7FC),
                            size: 20,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          widget.msgname,
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 10, 20),
                width: double.infinity,
                child: w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
