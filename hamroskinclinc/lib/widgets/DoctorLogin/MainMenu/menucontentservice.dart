import 'package:flutter/material.dart';

class ServiceMenuContent extends StatelessWidget {
  const ServiceMenuContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Services',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('ServiceDetials');
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: Color(0xff2196F3),
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 140,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        'assets/image/icon.png',
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Skin Biopsy',
                          style: TextStyle(
                            color: Color(0xff4E4B66),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 140,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        'assets/image/icon.png',
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Skin Analyzer',
                          style: TextStyle(
                            color: Color(0xff4E4B66),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 140,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        'assets/image/icon.png',
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Q-Switched\nNdYAG Laser',
                          style: TextStyle(
                            color: Color(0xff4E4B66),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 140,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        'assets/image/icon.png',
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Narrow Band \nUVB Therapy',
                          style: TextStyle(
                            color: Color(0xff4E4B66),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
