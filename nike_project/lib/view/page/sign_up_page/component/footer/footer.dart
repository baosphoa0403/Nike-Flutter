import 'package:flutter/material.dart';
import 'package:nike_project/view/page/sign_up_page/sign_up.dart';
import 'package:nike_project/view/page/welcome.dart';

class FooterSignUp extends StatelessWidget {
  const FooterSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,        
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              'Already have an account?',
            ),
            GestureDetector(
              child: Text(
                'Login in',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              // onTap: () {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     return WelcomePage();
              //   }));              
              //},
            )
          ])
        ],
      ),
    );
  }

  checkbox() {
    //this.check?this.check=true:true;
  }
}
