import 'package:flutter/material.dart';
import 'package:nike_project/view/page/sign_up_page/component/backgroud.dart';
import 'package:nike_project/view/page/sign_up_page/component/body/body.dart';
import 'package:nike_project/view/page/sign_up_page/component/footer/footer.dart';
import 'package:nike_project/view/page/sign_up_page/component/header/header.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroudSignUp(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 5, right: 30, bottom: 5, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderSignUp(
                size: size,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              BodySignUp(),
              SizedBox(height: size.height * 0.01),
              FooterSignUp()
            ],
          ),
        ),
      ),
    );
  }
}
