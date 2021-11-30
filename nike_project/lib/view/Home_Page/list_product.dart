import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/model/entity/product_item/product_item.dart';
import 'package:nike_project/view/Home_Page/product_item.dart';

class Product extends StatelessWidget {
  Product({Key? key, required this.listProduct}) : super(key: key);
  Future<List<ProductItem>> listProduct;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductItem>>(
      future: listProduct,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(snapshot.data!.length, (index) {
                  return ProductItemComponent(
                      productItem: snapshot.data![index]);
                })),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
