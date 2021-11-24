import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan[200],
      ),
      child: SizedBox(
        height: 240,
        width: 600,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: Positioned(
                top: 0,
                left: 0,
                child: Image.asset("assets/slider.png",
                    height: 240, width: 600, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: -30,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.pink[50],
                ),
                child: Image.asset(
                  "assets/logo.png",
                  height: 70,
                  width: 70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
