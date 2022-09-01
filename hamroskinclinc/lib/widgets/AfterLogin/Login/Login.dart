import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 250,
                child:
                    Image.asset('assets/image/Logo2.png', fit: BoxFit.cover)),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xff2196F3),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('menu');
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xff2196F3),
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color(0xffEFF0F7),
                    filled: true,
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Color(0xffEFF0F7), width: 2.0),
                    ),
                    disabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffEFF0F7), width: 2.0),
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color(0xffEFF0F7),
                    filled: true,
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Color(0xffEFF0F7), width: 2.0),
                    ),
                    disabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffEFF0F7), width: 2.0),
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Password ??',
                  style: TextStyle(
                      color: Color(0xff1CC8EE), fontFamily: 'Poppins'),
                )),
            SizedBox(
              height: 50,
            ),
            Container(
                width: 650,
                height: 50,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xff2196F3),
                  border: Border.all(color: Color(0xffDEF9FF)),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xffDEF9FF),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ))),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Color(0xff2196F3),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    elevation: 5,
                    child: Icon(Icons.phone_rounded),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
