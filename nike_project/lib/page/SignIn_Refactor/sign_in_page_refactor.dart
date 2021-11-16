import 'package:flutter/material.dart';
import 'package:nike_project/common/Button/elevated_button_custom.dart';
import 'package:nike_project/common/ScocialButton/social_button.dart';
import 'package:nike_project/page/SignIn/button_back.dart';
import 'package:nike_project/page/SignIn_Refactor/text_field_email.dart';
import 'package:nike_project/page/SignIn_Refactor/text_field_password.dart';
import 'package:nike_project/view_models/sign_up_validation.dart';
import 'package:provider/provider.dart';

class SignUpFactory extends StatelessWidget {
  const SignUpFactory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        const ButtonBack(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            // Lottie.asset(
            //   "assets/71361-sign-in.json",
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            Text(
              "Sign In\nAccount",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                // backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        _buildForm(context),
        const SizedBox(
          height: 50,
        ),
        buildButtonLogin(context)
        // isStretched ? buildButtonLogin() : buildSmallButton(isDone)
      ],
    );
  }
}

Column _buildForm(BuildContext context) {
  final validationProvider = Provider.of<SignUpValidationProvider>(context);
  return Column(
    children: [
      buildTextFieldEmail(validationProvider, context),
      const SizedBox(
        height: 20,
      ),
      buildTextFieldPassword(validationProvider, context)
    ],
  );
}

ListView buildButtonLogin(BuildContext context) {
  final validationProvider = Provider.of<SignUpValidationProvider>(context);
  return ListView(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    children: <Widget>[
      ElevatedButtonCustom(
          width: MediaQuery.of(context).size.width,
          borderRadius: 10,
          child: const Text("Login In"),
          color: Colors.blueAccent.shade400,
          height: MediaQuery.of(context).size.height * 0.06,
          onPressed: validationProvider.submitData),
      const SizedBox(
        height: 20,
      ),
      SocialSignInButton(
        width: MediaQuery.of(context).size.height * 0.6,
        text: "Sign In With Google",
        color: Colors.white,
        textColor: Colors.black,
        onPressed: () {},
        borderRadius: 10.0,
        height: MediaQuery.of(context).size.height * 0.06,
        assertName: 'assets/google-48.png',
      ),
    ],
  );
}
