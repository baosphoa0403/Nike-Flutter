import 'package:flutter/material.dart';
import 'package:nike_project/page/ListProduct/list_product_provider.dart';
import 'package:provider/provider.dart';

class ListCartPage extends StatelessWidget {
  const ListCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeCart = Provider.of<ListCartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("List Cart"),
          actions: [Text(storeCart.calSumMoney().toString())],
        ),
        body: Column(
          children: <Widget>[
            storeCart.listCart.isNotEmpty
                ? ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        // onTap: () => {storeCart.addToCart( storeCart.listCart[index])},
                        child: ListTile(
                            title: Text(storeCart.listCart[index].product.name),
                            subtitle: Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      storeCart.increaseDecease(
                                          true, storeCart.listCart[index]);
                                    },
                                    child: const Text("+")),
                                Text(storeCart.listCart[index].quantity
                                    .toString()),
                                ElevatedButton(
                                    onPressed: () {
                                      storeCart.increaseDecease(
                                          false, storeCart.listCart[index]);
                                    },
                                    child: const Text("-")),
                                Text("price: " +
                                    storeCart.listCart[index].product.price
                                        .toString())
                              ],
                            ),
                            trailing: Text("sum: " +
                                (storeCart.listCart[index].quantity *
                                        storeCart.listCart[index].product.price)
                                    .toString())),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: storeCart.listCart.length)
                : Container(
                    alignment: Alignment.bottomCenter,
                    child: const Text("No data"),
                  )
          ],
        ));
  }
}
