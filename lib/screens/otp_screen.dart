import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'next_screen.dart';
import 'package:my_pro/widgets/myButton.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({this.mobile});
  final String mobile;
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FocusNode focus2;
  FocusNode focus3;
  FocusNode focus4;
  String array = '';
  final tStyle = TextStyle(
      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);
  final otpDecoration = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.blue));
  TextEditingController p1 = TextEditingController();
  TextEditingController p2 = TextEditingController();
  TextEditingController p3 = TextEditingController();
  TextEditingController p4 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focus2 = FocusNode();
    focus3 = FocusNode();
    focus4 = FocusNode();
  }

  void nextField(String val, FocusNode focusNode) {
    if (val.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();
  }

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
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 25.0),
                          child: Text(
                            'Verify the OTP',
                            style: GoogleFonts.montserrat(
                              fontSize: 25.0,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                          child: Text(
                            'Enter OTP',
                            style: GoogleFonts.montserrat(
                                color: Colors.grey, fontSize: 15.0),
                          ),
                        ),
                        Form(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, top: 20.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: 60.0,
                                    child: TextFormField(
                                      controller: p1,
                                      onChanged: (value) {
                                        array = '';
                                        array = array + value;
                                        setState(() {
                                          nextField(value, focus2);
                                        });
                                      },
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      style: tStyle,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: p1.text == ''
                                            ? Colors.white
                                            : Colors.blue,
                                        focusedBorder: otpDecoration,
                                        enabledBorder: otpDecoration,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: 60.0,
                                    child: TextFormField(
                                      controller: p2,
                                      focusNode: focus2,
                                      onChanged: (value) {
                                        array = array + value;

                                        setState(() {
                                          nextField(value, focus3);
                                        });
                                      },
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      style: tStyle,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        fillColor: p2.text == ''
                                            ? Colors.white
                                            : Colors.blue,
                                        filled: true,
                                        focusedBorder: otpDecoration,
                                        enabledBorder: otpDecoration,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: 60.0,
                                    child: TextFormField(
                                      controller: p3,
                                      focusNode: focus3,
                                      onChanged: (value) {
                                        array = array + value;
                                        setState(() {
                                          nextField(value, focus4);
                                        });
                                      },
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      style: tStyle,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: p3.text == ''
                                            ? Colors.white
                                            : Colors.blue,
                                        focusedBorder: otpDecoration,
                                        enabledBorder: otpDecoration,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    height: 60.0,
                                    child: TextFormField(
                                      controller: p4,
                                      focusNode: focus4,
                                      onChanged: (value) {
                                        array = array + value;
                                        setState(() {
                                          focus4.unfocus();
                                        });
                                      },
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      style: tStyle,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        fillColor: p4.text == ''
                                            ? Colors.white
                                            : Colors.blue,
                                        filled: true,
                                        focusedBorder: otpDecoration,
                                        enabledBorder: otpDecoration,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                          child: buildTimer(),
                        ),
                        MyButton(
                          onPressed: () {
                            verifyOtp(array);
                          },
                          text: 'Verify OTP',
                        ),
                      ],
                    ),
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

  verifyOtp(String array) async {
    Map data = {
      "mobile": widget.mobile.toString(),
      "otp": array.toString(),
      "deviceToken": "ez6IQF0SByp2KY4eAQHD8KhDJpaVUoe4",
      "deviceType": "A"
    };
    var jsonData = null;
    var response =
        await http.post('http://54.164.251.83:8081/user/verifyotp', body: data);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body.toString());
      print(jsonData);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NextScreen()));
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "ALERT",
        style: AlertStyle(backgroundColor: Colors.white),
        desc: jsonDecode(response.body)['message'],
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
      print(array.length);
      print(array);
      print(response.body);
    }
    setState(() {
      p1.clear();
      p2.clear();
      p3.clear();
      p4.clear();
      array = '';
    });
  }
}

Row buildTimer() {
  return Row(
    children: [
      Text(
        "Resend OTP in ",
        style: TextStyle(color: Colors.grey),
      ),
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 0.0),
        duration: Duration(seconds: 30),
        builder: (_, value, child) => Text(
          "00:${value.toInt()}",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    ],
  );
}
