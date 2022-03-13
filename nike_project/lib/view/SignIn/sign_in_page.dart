import 'package:flutter/material.dart';
import 'package:nike_project/view/SignIn/sign_in_page_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(40),
          // child: SignInBody(),
          child: const SignInBody(),
        ),
      ),
    );
  }
}
