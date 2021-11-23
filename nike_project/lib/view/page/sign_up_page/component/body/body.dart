import 'package:flutter/material.dart';
import 'package:nike_project/view/common/Button/elevated_button_custom.dart';
import 'package:nike_project/view/common/Input/input_text_custom.dart';
import 'package:nike_project/view/contants/contants.dart';
import 'package:nike_project/viewmodel/provider/sign_up_provider.dart';
import 'package:provider/provider.dart';

class BodySignUp extends StatelessWidget {
  BodySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _form(context,size, signUpProvider),
          SizedBox(height: size.height * 0.05),
          _buildSignUp(context,size, signUpProvider),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }

  Form _form(BuildContext context,size,SignUpProvider signUpProvider) {
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
            onChanged: (value) {
              signUpProvider.changeUserName(value);
            },
            validator: (value) {},
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
              signUpProvider.changePassword(value);
            },
            validator: (value) {},
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
              signUpProvider.changeEmail(value);
            },
            validator: (value) {},
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
              signUpProvider.changeName(value);
            },
            validator: (value) {},
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
              signUpProvider.changeYob(value);
            },
            validator: (value) {},
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
              signUpProvider.changeAddress(value);
            },
            validator: (value) {},
          ),
        ],
      ),
    );
  }

  Column _buildSignUp(BuildContext context,size,SignUpProvider signUpProvider) {
    return Column(
      children: <Widget>[
        ElevatedButtonCustom(
          onPressed: 
          () {
            signUpProvider.submitData();
          }
          ,
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
