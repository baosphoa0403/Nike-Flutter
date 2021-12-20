import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget StoryButton(String imgUrl, String userName) {
  return Column(
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
        radius: 20.0,
      ),
      SizedBox(height: 20.0,),
      Text(userName, style: TextStyle(color: Colors.white),)
    ],
  );
}