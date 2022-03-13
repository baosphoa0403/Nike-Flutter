import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nike_project/view/contants/contants.dart';

class HeaderSignUp extends StatelessWidget {
  const HeaderSignUp({Key? key,required this.size}) : super(key: key);
  final Size size;

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
          SizedBox(height: size.height*0.01),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Text(
              "Create\nAccount",
              style: TextStyle(
                color: kTextColor,
                fontSize: 35,
                fontWeight: FontWeight.w700,
                height: 1.2,
                fontFamily: kFontFamily_Title,
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Lottie.asset(
              "assets/46247-developing-section-update.json",
              width: size.width * 0.45,
            )
          ]),
        ],
      ),
    );
  }
}
