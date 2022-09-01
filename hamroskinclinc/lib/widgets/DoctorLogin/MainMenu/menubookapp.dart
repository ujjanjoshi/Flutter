import 'package:flutter/material.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20, 0, 25, 0),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xffFCFCFC),
          border: Border.all(color: Color(0xFF2196F3)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('login');
            },
            child: Text(
              'Book an appointment',
              style: TextStyle(
                  color: Color(0xff2196F3),
                  fontSize: 16,
                  fontFamily: 'Poppins'),
            )));
  }
}
