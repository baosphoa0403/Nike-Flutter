import 'package:flutter/material.dart';

import 'package:nike_project/view/SignIn/sign_in_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInPage(),
    );
  }
}
