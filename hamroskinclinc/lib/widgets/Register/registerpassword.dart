import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class RegisterPassword extends StatefulWidget {
  const RegisterPassword({Key? key}) : super(key: key);

  @override
  State<RegisterPassword> createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  String password = "";
  String confirmpassword = "";
  var datas;
  var outputs;
  String url = "";
  void chckpass() async {
    url = "http://192.168.0.101:4000/app/registerpassword?password=" + password;
    datas = await fetchdata(url);
    var decoded = jsonDecode(datas);
    outputs = decoded['valid'];
    setState(() {
      if (password == confirmpassword) {
        print(true);

        if (outputs) {
          print(outputs);
          Navigator.of(context).pushNamed('login');
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error!!"),
                  content: Text("Data Not Match"),
                  actions: [
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop('RegisterPassword');
                      },
                    ),
                  ],
                );
              });
        }
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error!!"),
                content: Text("Data Not Match"),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop('RegisterPassword');
                    },
                  ),
                ],
              );
            });
      }
    });
    if (password == confirmpassword) {
      print(true);
      // setState(() async {
      //   url = "http://192.168.0.101:4000/app/registerpassword?password=" +
      //       password;
      //   datas = await fetchdata(url);
      //   var decoded = jsonDecode(datas);
      //   outputs = decoded['valids'];

      //   if (outputs) {
      //     print(outputs);
      //     // Navigator.of(context).pushNamed('RegisterPassword');
      //   } else {
      //     print('nooutput');
      //     showDialog(
      //         context: context,
      //         builder: (BuildContext context) {
      //           return AlertDialog(
      //             title: Text("Error!!"),
      //             content: Text("Enter Correct OTP"),
      //             actions: [
      //               TextButton(
      //                 child: Text("OK"),
      //                 onPressed: () {
      //                   // Navigator.of(context).pop('RegisterOtp');
      //                 },
      //               ),
      //             ],
      //           );
      //         });
      //   }
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 350,
                  child:
                      Image.asset('assets/image/Logo2.png', fit: BoxFit.cover)),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff4E4B66),
                        fontFamily: 'Poppins',
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffEFF0F7),
                      filled: true,
                      hintText: 'Enter Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Color(0xffEFF0F7), width: 2.0),
                      ),
                      disabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffEFF0F7), width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  onChanged: (value) {
                    confirmpassword = value;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffEFF0F7),
                      filled: true,
                      hintText: 'Confirm Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Color(0xffEFF0F7), width: 2.0),
                      ),
                      disabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffEFF0F7), width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              SizedBox(
                height: 60,
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
                        chckpass();
                        // Navigator.of(context).pushNamed('login');
                      },
                      child: Text(
                        'Finish',
                        style: TextStyle(
                            color: Color(0xffDEF9FF),
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ))),
              // SizedBox(
              //   height: 30,
              // ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //   child: TextButton(
              //       onPressed: () {},
              //       child: Text(
              //         'Register',
              //         style: TextStyle(
              //             color: Color(0xff2196F3),
              //             fontFamily: 'Poppins',
              //             fontSize: 16),
              //       )),
              // ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.end,
              //     children: [
              //       FloatingActionButton(
              //         onPressed: () {},
              //         elevation: 5,
              //         child: Icon(Icons.phone_rounded),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ));
  }
}
