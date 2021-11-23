import 'package:flutter/material.dart';
import 'package:nike_project/page/DemoListProduct/Provider/provider_product.dart';
import 'package:nike_project/page/main_page.dart';
import 'package:nike_project/view_models/sign_up_validation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpValidationProvider>(
            create: (context) => SignUpValidationProvider()),
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
      ),
    );
  }
}
