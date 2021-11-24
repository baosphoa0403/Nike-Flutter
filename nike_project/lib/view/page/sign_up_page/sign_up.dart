import 'package:flutter/material.dart';
import 'package:nike_project/view/page/sign_up_page/component/screen.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenSignUp(),
    );
  }
}
