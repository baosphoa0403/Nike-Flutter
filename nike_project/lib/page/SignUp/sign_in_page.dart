import 'package:flutter/material.dart';
import 'package:nike_project/page/SignUp/sign_in_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(40),
        child: SignInBody(),
      ),
    );
  }
}
