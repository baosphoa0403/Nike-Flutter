import 'package:flutter/material.dart';
import 'package:nike_project/common/Button/elevated_button_custom.dart';
import 'package:nike_project/common/Button/outlined_button_customer.dart';
import 'package:nike_project/contants/contants.dart';
import 'package:nike_project/page/sign_up_page/component/backgroud.dart';
import 'package:nike_project/page/sign_up_page/component/body/body.dart';
import 'package:nike_project/page/sign_up_page/component/footer/footer.dart';
import 'package:nike_project/page/sign_up_page/component/header/header.dart';
import 'package:nike_project/page/sign_up_page/contants/contans.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroudSignUp(
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             SizedBox(height: sizeBox_big_widget),
              HeaderSignUp(),
              SizedBox(
                height: sizeBox_big_widget,
              ),
              BodySignUp(),
              SizedBox(height: sizeBox_big_widget),
              FooterSignUp()
            ],
          ),
        ),
      ),
    );
  }
}
