import 'package:flutter/material.dart';
import 'package:nike_project/page/SignIn/sign_in_page.dart';
import 'package:nike_project/page/SignIn_Refactor_RP/sign_in_page_refactor_rp.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInFactoryRP(),
    );
  }
}
