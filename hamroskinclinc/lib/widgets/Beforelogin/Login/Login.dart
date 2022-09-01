import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/mainmenuafter.dart';
import 'package:hamroskinclinc/widgets/Register/registerotp.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emails = "";
  String passwords = "";
  String url = "";
  var id;
  var data;
  var output;
  void valdiation() async {
    url = "http://192.168.0.101:2000/app/loginvalidation?email=" +
        emails +
        "&password=" +
        passwords;
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    setState(() {
      output = decoded['valid'];
      id = decoded['id'].toString();
      if (output) {
        print(id.indexOf("P"));
        print(output);
        int val = id.indexOf("P");
        if (val == 1) {
          Navigator.of(context).pushNamed('MainMenuAfter');
        } else {
          Navigator.of(context).pushNamed('MainMenuDoctor');
        }
        // Navigator.of(context).pushNamed('RegisterOtp');
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
                      Navigator.of(context).pop('login');
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 300,
                  child:
                      Image.asset('assets/image/Logo2.png', fit: BoxFit.cover)),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xff2196F3),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('menu');
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Color(0xff2196F3),
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  onChanged: (value) {
                    emails = value;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffEFF0F7),
                      filled: true,
                      hintText: 'Email',
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
                height: 25,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  onChanged: (value) {
                    passwords = value;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffEFF0F7),
                      filled: true,
                      hintText: 'Password',
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
                height: 25,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password ??',
                    style: TextStyle(
                        color: Color(0xff1CC8EE), fontFamily: 'Poppins'),
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 650,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xff2196F3),
                    border: Border.all(color: Color(0xffDEF9FF)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                      onPressed: () {
                        valdiation();
                        // Navigator.of(context).pushNamed('MainMenuAfter');
                        // MainMenuAfter(doctorname);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Color(0xffDEF9FF),
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ))),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('Register');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Color(0xff2196F3),
                          fontFamily: 'Poppins',
                          fontSize: 16),
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      elevation: 5,
                      child: Icon(Icons.phone_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
