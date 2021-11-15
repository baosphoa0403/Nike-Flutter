import 'package:flutter/material.dart';
import 'package:nike_project/model/request/user_signup_request.dart';
import 'package:nike_project/view/common/Button/elevated_button_custom.dart';
import 'package:nike_project/view/common/Button/outlined_button_customer.dart';
import 'package:nike_project/view/common/Input/input_text_custom.dart';
import 'package:nike_project/view/common/common.dart';
import 'package:nike_project/view/contants/contants.dart';
import 'package:nike_project/viewmodel/signup_view_model.dart';

class BodySignUp extends StatefulWidget with EmailAndPasswordValidator {
  BodySignUp({Key? key}) : super(key: key);

  @override
  _BodySignUpState createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  //input
  String username = "";
  String email = "";
  String password = "";
  String name = "";
  int yearOfBirth = 0;
  String address = "";
  //button
  bool check = true;
  bool _submited = false;
  //notification
  String msg="";

  String? _validatorEmail(String? value) {
    if (widget.emailValidator.isStringEmpty(value!)) {
      return "Email is empty";
    }
    if (!widget.emailValidator.isEmailValid(value)) {
      return "Email not format";
    }
    return null;
  }

  checkbox() {}

  _submit() async {
    setState(() {
      _submited = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    SignUpViewModel().signUp(UserSignUpRequest(
      username: this.username,
      email: this.email,
      password: this.password,
      name: this.name,
      yearOfBirth: this.yearOfBirth,
      address: this.address,
    ));

    setState(() {
      _submited = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _form(size),
          SizedBox(height: size.height * 0.05),
          _buildSignUp(size),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }

  Form _form(size) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputTextCustom(
            width: size.width,
            height: size.height * 0.07,
            textLabel: "User Name",
            fontWeight_label: kFontWeight_Label,
            fontFamily_label: kFontFamily_Label,
            color_backgroud: Colors.lightBlue.shade50,
            padding: 15,
            radius: 10,
            suffixIcon: Icon(Icons.people),
            onChanged: (value) {},
            validator: _validatorEmail,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          InputTextCustom(
            width: size.width,
            height: size.height * 0.07,
            textLabel: "Password",
            fontWeight_label: kFontWeight_Label,
            fontFamily_label: kFontFamily_Label,
            color_backgroud: Colors.lightBlue.shade50,
            padding: 15,
            radius: 10,
            suffixIcon: Icon(Icons.remove_red_eye),
            onChanged: (value) {
              setState(() {});
            },
            validator: _validatorEmail,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          InputTextCustom(
            width: size.width,
            height: size.height * 0.07,
            textLabel: "Email",
            fontWeight_label: kFontWeight_Label,
            fontFamily_label: kFontFamily_Label,
            color_backgroud: Colors.lightBlue.shade50,
            padding: 15,
            radius: 10,
            suffixIcon: Icon(Icons.email_sharp),
            onChanged: (value) {
              setState(() {});
            },
            validator: _validatorEmail,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          InputTextCustom(
            width: size.width,
            height: size.height * 0.07,
            textLabel: "Name",
            fontWeight_label: kFontWeight_Label,
            fontFamily_label: kFontFamily_Label,
            color_backgroud: Colors.lightBlue.shade50,
            padding: 15,
            radius: 10,
            suffixIcon: Icon(Icons.brush),
            onChanged: (value) {
              setState(() {});
            },
            validator: _validatorEmail,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          InputTextCustom(
            width: size.width,
            height: size.height * 0.07,
            textLabel: "Year Of Birth",
            fontWeight_label: kFontWeight_Label,
            fontFamily_label: kFontFamily_Label,
            color_backgroud: Colors.lightBlue.shade50,
            padding: 15,
            radius: 10,
            suffixIcon: Icon(Icons.calendar_today_sharp),
            onChanged: (value) {
              setState(() {});
            },
            validator: _validatorEmail,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          InputTextCustom(
            width: size.width,
            height: size.height * 0.07,
            textLabel: "Address",
            fontWeight_label: kFontWeight_Label,
            fontFamily_label: kFontFamily_Label,
            color_backgroud: Colors.lightBlue.shade50,
            padding: 15,
            radius: 10,
            suffixIcon: Icon(Icons.add_location_alt),
            onChanged: (value) {
              setState(() {});
            },
            validator: _validatorEmail,
          ),
        ],
      ),
    );
  }

  Column _buildSignUp(size) {
    return Column(
      children: <Widget>[
        ElevatedButtonCustom(
          onPressed: _submit,
          color: kButtonColor,
          borderRadius: 10,
          height: size.height * 0.06,
          width: size.width,
          child: Text(
            'Create Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
