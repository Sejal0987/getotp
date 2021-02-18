import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:my_pro/widgets/myButton.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyMainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 10.0),
            child: Text(
              'Proceed with your login.',
              style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Login',
              style: GoogleFonts.montserrat(
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 10,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  leading: Image.asset(
                    'images/mobile.png',
                  ),
                  title: Text(
                    'Enter mobile number',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        color: Colors.black38, fontSize: 15.0),
                  ),
                  subtitle: TextField(
                    controller: mobile,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 10.0, bottom: 10.0, right: 5.0),
            child: Text(
              'A 4 digit OTP will send you via SMS to verify your mobile number! ',
              style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 15.0),
            ),
          ),
          MyButton(
              onPressed: () {
                getOtp(mobile.text);
              },
              text: 'Send OTP')
        ],
      ),
    );
  }

  getOtp(String text) async {
    Map data = {
      "mobile": text,
    };
    var jsonData = null;
    var response =
        await http.post('http://54.164.251.83:8081/user/login', body: data);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body.toString());
      print(jsonData);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(mobile: mobile.text)));
    } else if (response.statusCode == 400) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "ALERT",
        style: AlertStyle(backgroundColor: Colors.white),
        desc: "Your mobile number is not registered with us.",
        buttons: [
          DialogButton(
            color: Colors.red,
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      print('hello');
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "ALERT",
        style: AlertStyle(backgroundColor: Colors.white),
        desc: "Internal Server Error",
        buttons: [
          DialogButton(
            color: Colors.red,
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
  }
}

class MyMainLayout extends StatelessWidget {
  final Widget child;
  MyMainLayout({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset('images/login-logo.png')),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: SingleChildScrollView(
                    child: child,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
