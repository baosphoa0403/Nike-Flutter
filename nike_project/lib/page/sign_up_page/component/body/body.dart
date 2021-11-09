import 'package:flutter/material.dart';
import 'package:nike_project/contants/contants.dart';
import 'package:nike_project/page/sign_up_page/contants/contans.dart';

class BodySignUp extends StatelessWidget {
  const BodySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Your Email',
            style: TextStyle(
                fontWeight: FontWeight.w500, fontFamily: kFontFamily_Label),
          ),
          SizedBox(
            height: sizeBox_filed,
          ),
          TextField(
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "",
                fillColor: Colors.lightBlue[50],
                filled: true,
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                suffixIcon: Icon(Icons.email_rounded)
                ),
            cursorHeight: 22,
          ),
          SizedBox(
            height: sizeBox_small_widget,
          ),
          Text(
            'Password',
            style: TextStyle(
                fontWeight: FontWeight.w500, fontFamily: "Time New Roman"),
          ),
          SizedBox(
            height: sizeBox_filed,
          ),
          TextField(
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: "",
                fillColor: Colors.lightBlue[50],
                filled: true,
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                suffixIcon: Icon(Icons.remove_red_eye)),
            cursorHeight: 22,
          ),
        ],
      ),
    );
  }
}
