import 'package:flutter/material.dart';
import 'package:nike_project/model/request/user_signup_request.dart';
import 'package:nike_project/view/common/Button/elevated_button_custom.dart';
import 'package:nike_project/view/common/Button/outlined_button_customer.dart';
import 'package:nike_project/view/common/Input/input_text_custom.dart';
import 'package:nike_project/view/common/common.dart';
import 'package:nike_project/view/contants/contants.dart';
import 'package:nike_project/viewmodel/sign_up_provider.dart';
import 'package:nike_project/viewmodel/signup_view_model.dart';
import 'package:provider/provider.dart';

class BodySignUp extends StatelessWidget {
  BodySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _form(size, context, signUpProvider),
          SizedBox(height: size.height * 0.05),
          _buildSignUp(size, context, signUpProvider),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }

  Form _form(size, BuildContext context, SignUpProvider signUpProvider) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.people),
              labelText: "User name",
              fillColor: Colors.lightBlue.shade50,
              filled: true,
              contentPadding: const EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (String value) {
              signUpProvider.changeUserName(value);
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.remove_red_eye),
              labelText: "Password",
              fillColor: Colors.lightBlue.shade50,
              filled: true,
              contentPadding: const EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (String value) {
              signUpProvider.changePassword(value);
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.email_sharp),
              labelText: "Email",
              fillColor: Colors.lightBlue.shade50,
              filled: true,
              contentPadding: const EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (String value) {
              signUpProvider.changeEmail(value);
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.brush),
              labelText: "Name",
              fillColor: Colors.lightBlue.shade50,
              filled: true,
              contentPadding: const EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (String value) {
              signUpProvider.changeName(value);
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.calendar_today_sharp),
              labelText: "Year Of Birth",
              fillColor: Colors.lightBlue.shade50,
              filled: true,
              contentPadding: const EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (String value) {
              signUpProvider.changeYob(value);
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.add_location_alt_sharp),
              labelText: "Address",
              fillColor: Colors.lightBlue.shade50,
              filled: true,
              contentPadding: const EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (String value) {
              signUpProvider.changeAddress(value);
            },
          ),
        ],
      ),
    );
  }

  Column _buildSignUp(
      size, BuildContext context, SignUpProvider signUpProvider) {
    return Column(
      children: <Widget>[
        ElevatedButtonCustom(
          onPressed: () {
            signUpProvider.submitData();
          },
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
