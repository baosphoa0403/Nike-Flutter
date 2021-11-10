import 'package:flutter/material.dart';
import 'package:nike_project/common/Button/elevated_button_custom.dart';
import 'package:nike_project/common/Button/outlined_button_customer.dart';
import 'package:nike_project/contants/contants.dart';
import 'package:nike_project/page/sign_up_page/contants/contans.dart';

class FooterSignUp extends StatelessWidget {
  final bool check;
  const FooterSignUp({Key? key, this.check = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Checkbox(
                checkColor: Colors.lightBlue,
                onChanged: checkbox(),
                value: this.check,
                activeColor: Colors.white,
              ),
              SizedBox(width: size.width*0.1),
              Text(
                'I agree to the Terms & Conditions\nand Privacy Policy',
                style: TextStyle(color: kTextColor),
              )
            ],
          ),
          SizedBox(height: sizeBox_big_widget),
          ElevatedButtonCustom(
            onPressed: () {},
            color: kButtonColor,
            child: Text(
              'Create Account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: sizeBox_small_widget),
          OutLinedButtonCustom(
            child: Text(
              'Sign Up With Google',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue),
            ),
            color: Colors.lightBlue,
            colorBorder: Colors.lightBlue,
            onPressed: () {}, icon: Icon(Icons.ac_unit_outlined),),
          SizedBox(height: sizeBox_big_widget),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              Text(
              'Already have an account? Login in',              
            ),
            ]
          )
        ],
      ),
    );
  }
  
  checkbox() {
    //this.check?this.check=true:true;
  }
}
