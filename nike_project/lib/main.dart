import 'package:flutter/material.dart';
import 'package:nike_project/view/Home_Page/home_page.dart';
import 'package:nike_project/view/SignIn/sign_in_page.dart';
import 'package:nike_project/view/page/sign_up_page/sign_up.dart';
import 'package:nike_project/view_models/provider/sign_up_provider.dart';
import 'package:nike_project/view_models/provider/sign_in_validation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpProvider>(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider<SignInValidationProvider>(
          create: (context) => SignInValidationProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/HomePage",
        routes: {
          "/Login": (context) => const SignInPage(),
          "/HomePage": (context) => const HomePage(),
          "/SignUp": (context) => SignUpPage()
        },
        // home: const MainPageSignIn(),
      ),
    );
  }
}
