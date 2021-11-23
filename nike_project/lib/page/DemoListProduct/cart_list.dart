import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/page/DemoListProduct/Provider/provider_product.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: cartProvider.listCart.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(cartProvider.listCart[index].product.name),
                    subtitle: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            cartProvider.handleChangeQuantity(
                                true, cartProvider.listCart[index]);
                          },
                          child: Text("+"),
                        ),
                        Text(cartProvider.listCart[index].quantity.toString()),
                        ElevatedButton(
                          onPressed: () {
                            cartProvider.handleChangeQuantity(
                                false, cartProvider.listCart[index]);
                          },
                          child: Text("-"),
                        ),
                      ],
                    ),
                    trailing: Text((cartProvider.listCart[index].quantity *
                            cartProvider.listCart[index].product.price)
                        .toString()));
              },
            ),
            Text(cartProvider.listCart
                .fold(
                    0,
                    (total, element) =>
                        total = (element.quantity * element.product.price))
                .toString())
          ],
        ),
      ),
    );
  }
}
