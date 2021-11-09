import 'package:flutter/material.dart';
import 'package:nike_project/page/sign_up_page/component/screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenSignUp(),
    );
  }
}