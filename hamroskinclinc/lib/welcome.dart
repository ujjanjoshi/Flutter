import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2196F3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/image/Logo1.png'),
          SizedBox(
            height: 150,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              },
              child: Container(
                width: 650,
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Color(0xffDEF9FF)),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'NEXT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffDEF9FF),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
