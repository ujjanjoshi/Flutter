import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/MainMenu/mainmenulistprov.dart';
// import 'package:hamroskinclinc/widgets/Appointment/appointment.dart';
// import 'package:hamroskinclinc/widgets/Beforelogin/Appointment/DoctorDetails/Doctordetails.dart';
import 'package:hamroskinclinc/widgets/Afterlogin/Login/Login.dart';
import 'package:hamroskinclinc/widgets/Afterlogin/Drawers/fixdrawer.dart';
import 'widgets/Afterlogin/MainMenu/menubookapp.dart';
import 'widgets/Afterlogin/MainMenu/menucontentservice.dart';

import 'widgets/Beforelogin/MainMenu/menucontent.dart';

class MainMenuAfter extends StatefulWidget {
  @override
  State<MainMenuAfter> createState() => _MainMenuAfterState();
}

class _MainMenuAfterState extends State<MainMenuAfter> {
  String name = "";
  String field = "";
  void doctorname(String names, String spp) {
    setState(() {
      name = names;
      field = spp;
    });
  }

  Widget wdg = Column(
    children: [
      MenuContent(),
      ServiceMenuContent(),
      SizedBox(
        height: 30,
      ),
      BookAppointment(),
      DocotorLists(),
    ],
  );
  void menuchange(int id) {
    setState(() {
      if (id == 1) {
        wdg = Column(
          children: [
            MenuContent(),
            ServiceMenuContent(),
            SizedBox(
              height: 30,
            ),
            BookAppointment(),
            DocotorLists(),
          ],
        );
      } else if (id == 4) {
        wdg = Text('it is services');
      } else if (id == 5) {
        wdg = Text('it is profile');
      } else if (id == 6) {
        LoginPage();
      } else {
        wdg = wdg;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7FC),
      drawer: DrawerFix(menuchange),
      appBar: AppBar(
        foregroundColor: Color(0xff14142B),
        backgroundColor: Color(0xffF7F7FC),
        title:
            Container(width: 400, child: Image.asset('assets/image/Logo3.png')),
        actions: [
          Builder(
            builder: (context) => Container(
              height: 10,
              margin: EdgeInsets.all(5),
              width: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: wdg,
      ),
    );
  }
}
