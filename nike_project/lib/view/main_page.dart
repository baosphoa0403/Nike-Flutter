import 'package:flutter/material.dart';
import 'package:nike_project/view/page/sign_up_page/sign_up.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUpPage());
  }
}
