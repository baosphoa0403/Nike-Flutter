import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nike_project/contants/contants.dart';

class BackgroudSignUp extends StatelessWidget {
  final Widget child;
  const BackgroudSignUp({ Key? key,required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: child,
            color: kBackgroundColor,
          )                   
        ],
      ),
    );
  }
}