import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dropdowndefaultvalue = 'Gender';

  // List of items in our dropdown menu
  var gender = [
    'Gender',
    'Male',
    'Female',
    'Other',
  ];
  String dropdowndefaultstatus = 'Select Status';

  // List of items in our dropdown menu
  var status = [
    'Select Status',
    'Patient',
    'Doctor',
  ];
  Widget changd = Text(
    'Date of Birth',
    style: TextStyle(
      color: Colors.black,
      // color: Color(0xff6E7191),
      fontSize: 15,
      // fontWeight: FontWeight.bold,
      // fontFamily: "Poppins",
      // fontWeight: FontWeight.w100,
    ),
  );
  String name = "";
  String statued = "";
  String address = "";
  String dateofbirth = "";
  String age = "";
  String selectedgender = "";
  String email = "";
  var data;
  var output;
  String url = "";
  void prindata() async {
    url = "http://192.168.0.101:5000/app/register?name=" +
        name +
        "&status=" +
        statued +
        "&address=" +
        address +
        "&dateofbirth=" +
        dateofbirth +
        "&age=" +
        age +
        "&gender=" +
        selectedgender +
        "&email=" +
        email;
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    setState(() {
      output = decoded['valid'];
      if (output) {
        print(output);
        Navigator.of(context).pushNamed('RegisterOtp');
      } else {
        print('nooutput');
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
                      Navigator.of(context).pop('Register');
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
        backgroundColor: Color(0xffF7F7FC),
        appBar: AppBar(
          foregroundColor: Color(0xff4E4B66),
          backgroundColor: Color(0xffF7F7FC),
          title: Container(
            margin: EdgeInsets.only(left: 80),
            child: Text(
              'Register',
              style: TextStyle(
                  color: Color(0xff4E4B66),
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
              // textAlign: TextAlign.center,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  onChanged: (value) {
                    name = value.toString();
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffEFF0F7),
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.black,
                        // color: Color(0xff6E7191),
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w100,
                      ),
                      hintText: 'Name',
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
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xffEFF0F7),
                  border: Border.all(color: Color(0xffEFF0F7)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton(
                  value: dropdowndefaultstatus,
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),

                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    // fontWeight: FontWeight.w200,
                    // fontFamily: "Poppins",
                  ),
                  icon: Container(
                      margin: EdgeInsets.fromLTRB(210, 0, 0, 0),
                      child: const Icon(Icons.keyboard_arrow_down)),
                  elevation: 16,
                  // Array list of items
                  items: status.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdowndefaultstatus = newValue!;
                      statued = dropdowndefaultstatus;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  onChanged: (value) {
                    address = value.toString();
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffEFF0F7),
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.black,
                        // color: Color(0xff6E7191),
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w100,
                      ),
                      hintText: 'Address',
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
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xffEFF0F7),
                  border: Border.all(color: Color(0xffEFF0F7)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    changd,
                    TextButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1000, 01, 01),
                            maxTime: DateTime(2030, 12, 31), onChanged: (date) {
                          // print('change $date');
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
                          });
                          print('confirm $date');
                          dateofbirth =
                              DateFormat('yyyy/MM/dd').format(date).toString();
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
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
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  onChanged: (value) {
                    age = value.toString();
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffEFF0F7),
                      filled: true,
                      hintText: 'Age',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        // color: Color(0xff6E7191),
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w100,
                      ),
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
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xffEFF0F7),
                  border: Border.all(color: Color(0xffEFF0F7)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton(
                  value: dropdowndefaultvalue,
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),

                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    // fontWeight: FontWeight.w200,
                    // fontFamily: "Poppins",
                  ),
                  icon: Container(
                      margin: EdgeInsets.fromLTRB(240, 0, 0, 0),
                      child: const Icon(Icons.keyboard_arrow_down)),
                  elevation: 16,
                  // Array list of items
                  items: gender.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdowndefaultvalue = newValue!;
                      selectedgender = dropdowndefaultvalue;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  onChanged: (value) {
                    email = value.toString();
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffEFF0F7),
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.black,
                        // color: Color(0xff6E7191),
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w100,
                      ),
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
                height: 30,
              ),
              Container(
                  width: 650,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
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
                        // Navigator.of(context).pushNamed('RegisterOtp');
                        // MainMenuAfter(doctorname);
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Color(0xffDEF9FF),
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ))),
            ],
          ),
        ));
  }
}
