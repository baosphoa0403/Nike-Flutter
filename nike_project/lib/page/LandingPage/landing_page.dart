import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nike_project/page/Home_Page/home_page.dart';
import 'package:nike_project/page/SignIn/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  Future<String?> _getToken() async {
    const storage = FlutterSecureStorage();

    // Read value
    String? value = await storage.read(key: "token");
    return value;
  }

  String? token = "";

  @override
  Widget build(BuildContext context) {
    _getToken().then((String? value) {
      token = value;
    });
    print(token);

    return Scaffold(
      body: (token!.isNotEmpty ? HomePage() : (SignInPage())),
    );
  }
}
