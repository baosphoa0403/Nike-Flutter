import 'package:flutter/material.dart';
import 'package:nike_project/page/SignIn_Refactor/sign_in_page_refactor.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(40),
        // child: SignInBody(),
        child: const SignUpFactory(),
      ),
    );
  }
}
