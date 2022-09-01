import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class PatientsProfile extends StatefulWidget {
  const PatientsProfile({Key? key}) : super(key: key);

  @override
  State<PatientsProfile> createState() => _PatientsProfileState();
}

class _PatientsProfileState extends State<PatientsProfile> {
  void initState() {
    setState(() {
      profilename(context);
    });

    super.initState();
  }

  String url = "";
  var data;
  var output = "";

  Future profilename(BuildContext contex) async {
    await Future.delayed(Duration(seconds: 0));
    url = "http://192.168.0.101:10000/app/notifypatient";
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    setState(() {
      output = decoded['user'];
    });

    print(output);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        // width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('MainMenuAfter');
                  // getnotify();
                },
                child: Icon(Icons.home))
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
              color: Color(0xff2196F3),
              width: double.infinity,
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    // padding: EdgeInsets.all(40),
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xffD9D9D9),
                      border: Border.all(color: Color(0xFFCDECEE)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      output,
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 140,
                  height: 140,
                  // color: Color(0xff00966D),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xff00966D),
                    border: Border.all(color: Color(0xFFCDECEE)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popAndPushNamed('PrescriptionDetailsPatients');
                      },
                      child: Icon(
                        Icons.medication,
                        color: Color(0xffFFF9EF),
                        size: 100,
                      ))),
              Container(
                  width: 140,
                  height: 140,
                  // color: Color(0xff00966D),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffFF6262),
                    border: Border.all(color: Color(0xFFCDECEE)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popAndPushNamed('Drappointmentafter');
                      },
                      child: Icon(
                        Icons.schedule,
                        color: Color(0xffFFF9EF),
                        size: 100,
                      ))),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.all(20),
            // color: Color(0xff00966D),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xffFCFCFC),
                border: Border.all(color: Color(0xFFFCFCFC)),
                borderRadius: BorderRadius.circular(100)),
            child: Card(
              elevation: 7,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('login');
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Color(0xff4E4B66),
                        fontFamily: 'Poppins',
                        fontSize: 13),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
