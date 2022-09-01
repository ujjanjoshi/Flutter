import 'package:flutter/material.dart';

class DocotorLists extends StatefulWidget {
  @override
  State<DocotorLists> createState() => _DocotorListsState();
}

class _DocotorListsState extends State<DocotorLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Consult with doctors',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('DoctorDetialsafter');
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                          color: Color(0xff2196F3),
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
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
                          margin: EdgeInsets.fromLTRB(15, 2, 0, 0),
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xff2196F3),
                            border: Border.all(color: Color(0xff2196F3)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                              onPressed: () {
                                // widget.name = "Dr. Bikrant Dhakal";
                                // widget.field = "MBBS,MD";
                                Navigator.of(context)
                                    .pushNamed('Drappointmentafter');
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
                          margin: EdgeInsets.fromLTRB(15, 2, 0, 0),
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xff2196F3),
                            border: Border.all(color: Color(0xff2196F3)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('Drappointmentafter');
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
    );
  }
}
