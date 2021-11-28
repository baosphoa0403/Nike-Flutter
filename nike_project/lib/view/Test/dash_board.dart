import 'package:flutter/material.dart';
import 'package:nike_project/model/entity/product_item/product_item.dart';
import 'package:nike_project/repositories/product_item/product_item.impl.dart';
import 'package:nike_project/view/Home_Page/carousel.dart';
import 'package:nike_project/view/Home_Page/intro.dart';
import 'package:nike_project/view/Home_Page/list_product.dart';

class ListProductPage extends StatefulWidget {
  @override
  _ListProductPageState createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  late Future<List<ProductItem>> listProductItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("//////////////////////////////////");
    listProductItem = ProductItemImpl().getListProduct();
  }

  @override
  Widget build(BuildContext context) {
    print(listProductItem);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ListProductPage'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Carousel(),
            Intro(),
            Product(
              listProduct: listProductItem,
            )
          ],
        ),
      ),
    );
  }
}
