import 'package:flutter/material.dart';
import 'package:nike_project/page/ListCart/list_cart_page.dart';
import 'package:nike_project/page/ListProduct/list_product_provider.dart';
import 'package:nike_project/page/SignIn/sign_in_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeCart = Provider.of<ListCartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show List Product"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListCartPage()),
              );
            },
            child: Row(
              children: <Widget>[
                const Icon(Icons.shopping_cart),
                Text(storeCart.calSumQuantityCart().toString())
              ],
            ),
          ),
        ],
      ),
      body: const SignInPage(),
    );
  }
}
