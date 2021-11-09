import 'package:flutter/material.dart';
import 'package:nike_project/page/SignUp/sign_up_page_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(40),
        child: BuildChildren(),
      ),
    );
  }
}
