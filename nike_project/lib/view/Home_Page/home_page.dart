import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/contants/contants.dart';
import 'package:nike_project/view/Home_Page/carousel.dart';
import 'package:nike_project/view/Home_Page/intro.dart';
import 'package:nike_project/view/Home_Page/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                  width: 205,
                  height: 30,
                  child: TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                    labelText: 'Search',
                  ))),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
            ],
          )),
      body: ListView(
        children: const [Carousel(), Intro(), Product()],
      ),
    );
  }
}
