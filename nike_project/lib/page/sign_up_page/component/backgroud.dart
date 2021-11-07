import 'package:flutter/material.dart';

class BackgroudSignUp extends StatelessWidget {
  final Widget child;
  const BackgroudSignUp({ Key? key,required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
         // Positioned(child: Image.asset("")),
          child
        ],
      ),
    );
  }
}