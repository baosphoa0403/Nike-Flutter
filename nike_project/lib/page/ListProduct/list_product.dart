import 'package:flutter/material.dart';
import 'package:nike_project/page/ListProduct/list_product_provider.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listProduct = Provider.of<ListProductProvider>(context).listProduct;
    final storeCart = Provider.of<ListCartProvider>(context);
    return Column(
      children: <Widget>[
        ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => {storeCart.addToCart(listProduct[index])},
                child: ListTile(
                    title: Text(listProduct[index].name),
                    subtitle: Text(listProduct[index].description),
                    trailing: Text(listProduct[index].price.toString())),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: listProduct.length)
      ],
    );
  }
}
