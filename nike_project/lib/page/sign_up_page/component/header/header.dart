import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nike_project/contants/contants.dart';
import 'package:nike_project/page/sign_up_page/contants/contans.dart';

class HeaderSignUp extends StatelessWidget {
  const HeaderSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightBlue[50]!),
                shape:
                    MaterialStateProperty.all<OutlinedBorder>(CircleBorder())),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
              splashRadius: 30,
              splashColor: Colors.blue[100],
            ),
          ),
          SizedBox(height: sizeBox_big_widget),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
              "Create\nAccount",
              style: TextStyle(
                  color: kTextColor,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  fontFamily: kFontFamily_Tile,
                  ),
            ),
            SizedBox(width: size.width*0.05,),
            Lottie.asset(
            "assets/46247-developing-section-update.json",
            width: size.width*0.45,)
            ] 
          ),
          
        ],
      ),
    );
  }
}
