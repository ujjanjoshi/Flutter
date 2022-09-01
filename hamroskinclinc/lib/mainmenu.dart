import 'package:flutter/material.dart';
// import 'package:hamroskinclinc/widgets/Beforelogin/Appointment/appointment.dart';
// import 'package:hamroskinclinc/widgets/Beforelogin/Appointment/DoctorDetails/Doctordetails.dart';
import 'package:hamroskinclinc/widgets/Beforelogin/Login/Login.dart';
import 'package:hamroskinclinc/widgets/Beforelogin/Drawers/fixdrawer.dart';
import 'package:hamroskinclinc/widgets/Beforelogin/MainMenu/mainmenulistprov.dart';
import 'widgets/Beforelogin/MainMenu/menubookapp.dart';
import 'widgets/Beforelogin/MainMenu/menucontentservice.dart';

import 'widgets/Beforelogin/MainMenu/menucontent.dart';

class MainMenu extends StatefulWidget {
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Widget wdg = Column(
    children: [
      MenuContent(),
      ServiceMenuContent(),
      SizedBox(
        height: 30,
      ),
      BookAppointment(),
      DocotorList(),
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
            DocotorList(),
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
              margin: EdgeInsets.all(10),
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xff2196F3),
                border: Border.all(color: Color(0xff2196F3)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('login');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  )),
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
