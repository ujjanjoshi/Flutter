import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamroskinclinc/mainmenuafter.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/Appointment/appointment.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/BookedAppointment/bookedappointment.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/DoctorDetails/Doctordetails.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/Message/messagerply.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/Message/patientmessage.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/Notification/notification.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/Profle/profile.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/Servicedetials/servicedetails.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/prescriptiondetias/patientpdetials.dart';
import 'package:hamroskinclinc/widgets/Beforelogin/Appointment/appointment.dart';
import 'package:hamroskinclinc/widgets/Beforelogin/DoctorDetails/Doctordetails.dart';
import 'package:hamroskinclinc/widgets/Beforelogin/Login/Login.dart';
import 'package:hamroskinclinc/widgets/Beforelogin/Servicedetials/servicedetails.dart';
import 'package:hamroskinclinc/widgets/DoctorLogin/Appointment/appointment.dart';
import 'package:hamroskinclinc/widgets/DoctorLogin/Message/doctormessage.dart';
import 'package:hamroskinclinc/widgets/DoctorLogin/Notification/notification.dart';
import 'package:hamroskinclinc/widgets/DoctorLogin/PatientsDetials/patientdetails.dart';
import 'package:hamroskinclinc/widgets/DoctorLogin/addprescription/AddPrescriptionWidget.dart';
import 'package:hamroskinclinc/widgets/DoctorLogin/prscriptiondetails/pescriptiondetials.dart';
import 'package:hamroskinclinc/widgets/Register/registerotp.dart';
import 'package:hamroskinclinc/widgets/Register/registerpassword.dart';
import 'package:hamroskinclinc/widgets/function/function.dart';
import 'mainmenu.dart';
import 'package:hamroskinclinc/welcome.dart';
import 'mainmenudoctor.dart';
import 'widgets/DoctorLogin/Message/messagerply.dart';
import 'widgets/Register/register.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String name = "";
  String field = "";
  void doctorname(String names, String spp) {
    setState(() {
      name = names;
      field = spp;
    });
  }

  String messageName = "";
  void getMesssageName(String MessageName) {
    setState(() {
      messageName = MessageName;
    });
  }

  String patientname = "";
  String doctornames = "";
  String dates = "";
  void addPrescription(String name, String doctorname, String date) {
    patientname = name;
    doctornames = doctorname;
    dates = date;
    print(patientname + doctornames + dates);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WelcomePage(),
      ),
      routes: {
        "login": (context) => LoginPage(),
        "menu": (context) => MainMenu(),
        "Drappointment": (context) => DoctorAppointment(),
        "DoctorDetials": (context) => DoctorDetials(),
        "ServiceDetials": (context) => ServiceDetails(),
        "MainMenuAfter": (context) => MainMenuAfter(),
        "Drappointmentafter": (context) => DoctorAppointmentAfter(doctorname),
        "RegisterOtp": (context) => RegisterOtp(),
        "Register": (context) => Register(),
        "RegisterPassword": (context) => RegisterPassword(),
        "DoctorDetialsafter": (context) => DoctorDetialsAfter(),
        "ServiceDetialsafter": (context) => ServiceDetailsAfter(),
        "BookedAppointment": (context) => BookedAppointment(name, field),
        "MainMenuDoctor": (context) => MainMenuDoctor(),
        "DoctorsideNotification": (context) => DoctorsideNotification(),
        "PatientAppointment": (context) => PatientAppointment(addPrescription),
        "PatientDetails": (context) => PatientDetails(),
        "DoctorMessage": (context) => DoctorMessage(getMesssageName),
        "Messagerply": (context) => Messagerply(messageName),
        "PatientsMessage": (context) => PatientsMessage(getMesssageName),
        "Messagereply": (context) => Messagereply(messageName),
        "PatientssideNotification": (context) => PatientssideNotification(),
        "AddPrescriptionWidget": (context) =>
            AddPrescriptionWidget(patientname, doctornames, dates),
        "PrescriptionDetails": (context) => PrescriptionDetails(),
        "PatientsProfile": (context) => PatientsProfile(),
        "PrescriptionDetailsPatients": (context) =>
            PrescriptionDetailsPatients(),
      },
    );
  }
}
