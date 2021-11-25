import 'package:flutter/material.dart';
import 'package:nike_project/view/contants/contants.dart';

// ignore: must_be_immutable
class MaterialButtonCustoms extends StatelessWidget {
  VoidCallback onPressedFunction;
  int currentTab;
  int index;
  IconData icon;
  String content;
  MaterialButtonCustoms({
    Key? key,
    required this.content,
    required this.icon,
    required this.index,
    required this.currentTab,
    required this.onPressedFunction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print("current tab" + currentTab.toString());
    // print("index " + index.toString());
    return MaterialButton(
      minWidth: 40,
      onPressed: onPressedFunction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: currentTab == index ? colorButton : Colors.grey,
          ),
          Text(
            content,
            style: TextStyle(
              color: currentTab == index ? colorButton : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
