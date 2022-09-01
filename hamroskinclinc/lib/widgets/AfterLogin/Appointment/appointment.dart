import 'package:flutter/material.dart';
import 'package:hamroskinclinc/widgets/AfterLogin/BookedAppointment/bookedappointment.dart';

class DoctorAppointmentAfter extends StatefulWidget {
  final Function getname;
  DoctorAppointmentAfter(this.getname);
  @override
  State<DoctorAppointmentAfter> createState() => _DoctorAppointmentAfterState();
}

class _DoctorAppointmentAfterState extends State<DoctorAppointmentAfter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(left: 45),
            child: Text(
              'Select a doctor',
              style: TextStyle(
                color: Color(0xffF7F7FC),
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xffD9D9D9),
                            border: Border.all(color: Color(0xFFCDECEE)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 60,
                          height: 60,
                          child: Icon(Icons.person),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 1, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Dr. Bikrant Dhakal',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'MBBS,MD',
                                style: TextStyle(
                                    color: Color(0xff6E7191),
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xff2196F3),
                                  border: Border.all(color: Color(0xff2196F3)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      widget.getname(
                                          "Dr. Bikrant Dhakal", "MBBS,MD");
                                      // widget.name = "Dr. Bikrant Dhakal";
                                      // widget.field = "MBBS,MD";

                                      Navigator.of(context)
                                          .pushNamed('BookedAppointment');
                                    },
                                    child: Text(
                                      'Book an Appointment',
                                      style: TextStyle(
                                          color: Color(0xffF7F7FC),
                                          fontFamily: 'Poppins',
                                          fontSize: 13),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xffD9D9D9),
                            border: Border.all(color: Color(0xFFCDECEE)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 60,
                          height: 60,
                          child: Icon(Icons.person),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 1, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Dr. Merina Manandhar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'MBBS,MD',
                                style: TextStyle(
                                    color: Color(0xff6E7191),
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xff2196F3),
                                  border: Border.all(color: Color(0xff2196F3)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      widget.getname(
                                          "Dr. Merina Manandhar", 'MBBS,MD');
                                      Navigator.of(context)
                                          .pushNamed('BookedAppointment');
                                    },
                                    child: Text(
                                      'Book an Appointment',
                                      style: TextStyle(
                                          color: Color(0xffF7F7FC),
                                          fontFamily: 'Poppins',
                                          fontSize: 13),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xffD9D9D9),
                            border: Border.all(color: Color(0xFFCDECEE)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 60,
                          height: 60,
                          child: Icon(Icons.person),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 1, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Dr. Lalan Khatiwada',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'MD, CSLT',
                                style: TextStyle(
                                    color: Color(0xff6E7191),
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xff2196F3),
                                  border: Border.all(color: Color(0xff2196F3)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      widget.getname(
                                          "Dr. Lalan Khatiwada", 'MD, CSLT');
                                      Navigator.of(context)
                                          .pushNamed('BookedAppointment');
                                    },
                                    child: Text(
                                      'Book an Appointment',
                                      style: TextStyle(
                                          color: Color(0xffF7F7FC),
                                          fontFamily: 'Poppins',
                                          fontSize: 13),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xffD9D9D9),
                            border: Border.all(color: Color(0xFFCDECEE)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 60,
                          height: 60,
                          child: Icon(Icons.person),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 1, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Prof. Dr. Anil Kumar Jha',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'MBBS, MD, F.R.C.P(Edin)',
                                style: TextStyle(
                                    color: Color(0xff6E7191),
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xff2196F3),
                                  border: Border.all(color: Color(0xff2196F3)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      widget.getname("Prof. Dr. Anil Kumar Jha",
                                          'MBBS, MD, F.R.C.P(Edin)');
                                      Navigator.of(context)
                                          .pushNamed('BookedAppointment');
                                    },
                                    child: Text(
                                      'Book an Appointment',
                                      style: TextStyle(
                                          color: Color(0xffF7F7FC),
                                          fontFamily: 'Poppins',
                                          fontSize: 13),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
