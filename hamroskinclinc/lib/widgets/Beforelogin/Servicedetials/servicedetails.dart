import 'package:flutter/material.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(left: 80),
            child: Text(
              'Services',
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
                  height: 105,
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
                          child: Icon(Icons.health_and_safety_outlined),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 1, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Skin Biopsy',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
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
                  height: 105,
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
                          child: Icon(Icons.health_and_safety_outlined),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 1, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Skin Analyzer',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
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
                  height: 105,
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
                          child: Icon(Icons.health_and_safety_outlined),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 1, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Q-Switched NdYAG Laser',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
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
                  height: 105,
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
                          child: Icon(Icons.health_and_safety_outlined),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 1, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Narrow Band UVB Therapy',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
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
    ;
  }
}
