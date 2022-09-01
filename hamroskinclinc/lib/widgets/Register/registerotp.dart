import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class RegisterOtp extends StatefulWidget {
  @override
  State<RegisterOtp> createState() => _RegisterOtpState();
}

class _RegisterOtpState extends State<RegisterOtp> {
  // const RegisterOtp({Key? key}) : super(key: key);

  String value1 = "";
  String value2 = "";
  String value3 = "";
  String value4 = "";
  var datas;
  var outputs;
  String url = "";
  void prindata() async {
    url = "http://192.168.0.101:3000/app/verifyotp?value1=" +
        value1 +
        "&value2=" +
        value2 +
        "&value3=" +
        value3 +
        "&value4=" +
        value4;
    datas = await fetchdata(url);
    var decoded = jsonDecode(datas);
    setState(() {
      outputs = decoded['valids'];

      if (outputs) {
        Navigator.of(context).pushNamed('RegisterPassword');
      } else {
        print('nooutput');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error!!"),
                content: Text("Enter Correct OTP"),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop('RegisterOtp');
                    },
                  ),
                ],
              );
            });
      }
    });
    // print(name +
    //     "" +
    //     statued +
    //     "" +
    //     address +
    //     "" +
    //     dateofbirth +
    //     "" +
    //     age +
    //     "" +
    //     selectedgender +
    //     "" +
    //     email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 300,
                  child:
                      Image.asset('assets/image/Logo2.png', fit: BoxFit.cover)),
              Text(
                'OTP Verification',
                style: TextStyle(
                    color: Color(0xff4E4B66),
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              Text(
                'Check your email for OTP',
                style: TextStyle(
                    color: Color(0xff868282),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Enter OTP',
                style: TextStyle(
                    color: Color(0xff2196F3),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 49,
                      child: TextField(
                        onChanged: (value) {
                          value1 = value;
                        },
                        decoration: InputDecoration(
                            fillColor: Color(0xffEFF0F7),
                            filled: true,
                            // hintText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            disabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffEFF0F7), width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    Container(
                      width: 50,
                      // margin: EdgeInsets.fromLTRB(150, 0, 150, 0),
                      child: TextField(
                        onChanged: (value) {
                          value2 = value;
                        },
                        decoration: InputDecoration(
                            fillColor: Color(0xffEFF0F7),
                            filled: true,
                            // hintText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            disabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffEFF0F7), width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    Container(
                      width: 50,
                      // margin: EdgeInsets.fromLTRB(150, 0, 150, 0),
                      child: TextField(
                        onChanged: (value) {
                          value3 = value;
                        },
                        decoration: InputDecoration(
                            fillColor: Color(0xffEFF0F7),
                            filled: true,
                            // hintText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            disabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffEFF0F7), width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    Container(
                      width: 50,
                      // margin: EdgeInsets.fromLTRB(150, 0, 150, 0),
                      child: TextField(
                        onChanged: (value) {
                          value4 = value;
                        },
                        decoration: InputDecoration(
                            fillColor: Color(0xffEFF0F7),
                            filled: true,
                            // hintText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            disabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffEFF0F7), width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                  width: 650,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xff2196F3),
                    border: Border.all(color: Color(0xffDEF9FF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                      onPressed: () {
                        prindata();

                        // Navigator.of(context).pushNamed('RegisterPassword');
                        // MainMenuAfter(doctorname);
                      },
                      child: Text(
                        'Verify',
                        style: TextStyle(
                            color: Color(0xffDEF9FF),
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
