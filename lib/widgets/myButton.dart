import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyButton extends StatelessWidget {
  MyButton({this.onPressed, this.text});
  final Function onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 150.0, top: 15.0, left: 10.0),
      child: Material(
        elevation: 5.0,
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 100.0,
          height: 55.0,
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
