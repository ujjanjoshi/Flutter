import 'package:flutter/material.dart';

class DrawerFix extends StatefulWidget {
  final Function changemenu;
  DrawerFix(this.changemenu);
  @override
  State<DrawerFix> createState() => _DrawerFixState();
}

class _DrawerFixState extends State<DrawerFix> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
          children: [
            Container(
                width: 250,
                height: 250,
                child: Image.asset(
                  'assets/image/Logo1.png',
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 15, left: 15),
                        child: Icon(Icons.home_filled)),
                    Text('Home',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff4E4B66),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop(widget.changemenu(1));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 15, left: 15),
                        child: Icon(Icons.schedule)),
                    const Text('Appointment',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff4E4B66),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('PatientAppointment');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 15, left: 15),
                        child: Icon(Icons.contacts)),
                    const Text('My Patients',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff4E4B66),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('PatientDetails');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 15, left: 15),
                        child: Icon(Icons.message)),
                    const Text('Message',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff4E4B66),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('DoctorMessage');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 15, left: 15),
                        child: Icon(Icons.notification_add)),
                    const Text('Patient Requests',
                        style: TextStyle(
                          color: Color(0xff4E4B66),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                onTap: () {
                  Navigator.of(context)
                      .popAndPushNamed('DoctorsideNotification');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 15, left: 15),
                        child: Icon(Icons.settings)),
                    const Text('Settings',
                        style: TextStyle(
                          color: Color(0xff4E4B66),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                onTap: () {
                  // Navigator.of(context)
                  // .popAndPushNamed('DoctorsideNotification');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Container(
                width: 250,
                // margin: EdgeInsets.only(left: 56),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 15, left: 20),
                        child: Icon(Icons.logout)),
                    const Text('Logout',
                        style: TextStyle(
                          color: Color(0xffFF0606),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
