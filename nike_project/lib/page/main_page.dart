import 'package:flutter/material.dart';
import 'package:nike_project/page/DemoListProduct/product_list.dart';
import 'package:nike_project/page/SignIn/sign_in_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      // body: SignInPage(),
      body: ProductList(),
    );
  }
}
