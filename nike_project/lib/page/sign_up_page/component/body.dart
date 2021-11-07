import 'package:flutter/material.dart';
import 'package:nike_project/page/sign_up_page/component/backgroud.dart';

class BodySignUp extends StatelessWidget {
  const BodySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return BackgroudSignUp(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           Text(
                "Create",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                  
                ),
              ),
           // SizedBox(height: size.height *0.03,),
         Text(
                "Account",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                  
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
