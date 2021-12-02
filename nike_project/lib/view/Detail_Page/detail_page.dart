import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/model/entity/image/image.dart';
import 'package:nike_project/model/entity/quantity/quantity.dart';
import 'package:nike_project/model/modelUserResponse/info.dart' as prefix;
import 'package:nike_project/model/response/product_detail_response.dart';
import 'package:nike_project/view_models/provider/detail_product_provider.dart';

class DetailPage extends StatelessWidget {
  final Future<List<ProductDetailResponse>>? product;
  DetailPage({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 40.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "SHOES",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: _buildProductDetailsPage(context));
  }

  _buildProductDetailsPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return FutureBuilder<List<ProductDetailResponse>>(
        future: product,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _showImage(screenSize, snapshot.data![index].images),
                          SizedBox(height: 12.0),
                          _buildProductTitleWidget(
                              snapshot.data![index].info.product.name),
                          SizedBox(height: 12.0),
                          _InfoProduct(snapshot.data![index].info),
                          _SizeProcut(
                              screenSize, snapshot.data![index].quantities),
                          SizedBox(height: 12.0),
                          _buildBottomNavigationBar(context),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }

  _buildProductImagesWidgets() {
    return Container(
        decoration: new BoxDecoration(
      image: new DecorationImage(
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.6), BlendMode.dstATop),
        image: new AssetImage(
            "assets/photo/adidas-alphabounce-beyond-release-details-3.jpg"),
        fit: BoxFit.cover,
      ),
    ));
  }

  _showImage(Size screenSize, List<ImageProduct> listImage) {
    return CarouselSlider(
      options: CarouselOptions(
        height: screenSize.width * 0.5,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: listImage.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                ),
                height: screenSize.width * 0.6,
                width: screenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    //fit: BoxFit.cover,
                    image: NetworkImage(
                      i.urlImage,
                    ),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }

  _buildProductTitleWidget(String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  _InfoProduct(Info info) {
    return Column(
      children: [
        Text('${info.status.nameStatus}'),
        Text('${info.color.nameColor}'),
        Text('${info.gender.nameGender}')
      ],
    );
  }

  _SizeProcut(Size screenSize, List<Quantity> listQuantity) {
    return Column(children: [
      Row(
          children: listQuantity.map((item) {
        return Expanded(flex: 1, child: Text('quantity: ${item.quantity}'));
      }).toList()),
      Row(
          children: listQuantity.map((item) {
        return Expanded(flex: 1, child: Text('size: ${item.size.nameSize}\$'));
      }).toList()),
      Row(
          children: listQuantity.map((item) {
        return Expanded(flex: 1, child: Text('price: ${item.price}\$'));
      }).toList())
    ]);
  }

  _buildBottomNavigationBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text('ADD TO CART'),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
