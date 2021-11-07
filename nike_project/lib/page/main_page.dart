import 'package:flutter/material.dart';
import 'package:nike_project/page/sign_up_page/sign_up_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MainPage"),
      ),
      body: SignUp()
    );
  }
}
