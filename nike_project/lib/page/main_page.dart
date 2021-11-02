import 'package:flutter/material.dart';
import 'package:nike_project/common/Button/button_custom.dart';
import 'package:nike_project/common/Input/input_custom.dart';
import 'package:nike_project/contants/contants.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MainPage"),
      ),
      body: 
      Center(
        
        child: ElevatedButtonCustom(
        color: kPrimaryColor,
        onPressed: () {},
        child: Text('login',style: TextStyle(color: Colors.white),),)
       // child: InputDropdown(),
      ),
      
      // Row(
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 10),
      //       child: Text(
      //         "OR",
      //         style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
      //       ),
            
      //     ),
      //   ],
      // ),
    );
  }
}
