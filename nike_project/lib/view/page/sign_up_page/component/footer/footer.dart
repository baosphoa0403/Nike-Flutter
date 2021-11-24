import 'package:flutter/material.dart';
import 'package:nike_project/view/SignIn/sign_in_page.dart';

class FooterSignUp extends StatelessWidget {
  final String content;
  final String message;
  final Widget widget;
  const FooterSignUp({
    this.message = "Already have an account",
    this.content = "Login In",
    this.widget = const SignInPage(),
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
              message,
            ),
            GestureDetector(
              child: Text(
                content,
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return widget;
                }));
              },
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
