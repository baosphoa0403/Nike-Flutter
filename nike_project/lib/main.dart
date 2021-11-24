import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike_project/page/Home_Page/home_page.dart';
import 'package:nike_project/page/main_page.dart';
import 'package:nike_project/view_models/sign_in_validation.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/Login",
        routes: {
          "/Login": (context) => const MainPage(),
          "/HomePage": (context) => const HomePage()
        },
        // home: const MainPage(),
      );
  }
}

