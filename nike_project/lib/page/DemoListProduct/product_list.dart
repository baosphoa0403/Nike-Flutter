import 'dart:js';
import 'package:flutter/material.dart';
import 'package:nike_project/model/modelProduct/product.dart';
import 'package:nike_project/page/DemoListProduct/Provider/provider_product.dart';
import 'package:nike_project/page/DemoListProduct/cart_list.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context).listProduct;
    final cartProvider = Provider.of<CartProvider>(context);
    print(cartProvider.listCart.toString());
    return Container(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartList()),
                );
              },
              child: Row(children: <Widget>[
                const Icon(Icons.shopping_cart),
                Text(cartProvider.countTotal().toString())
              ])),
          Expanded(
            child: SizedBox(
              height: 500.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: productProvider.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          cartProvider.storageCart(productProvider[index]);
                        },
                        child: ListTile(
                            title: Text(productProvider[index].name),
                            trailing:
                                Text(productProvider[index].price.toString()),
                            subtitle: Text(productProvider[index].desc)),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
