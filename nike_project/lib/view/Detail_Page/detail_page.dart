import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

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
        body: _buildProductDetailsPage(context)
        // bottomNavigationBar: _buildBottomNavigationBar(context),
        );
  }

  _buildProductDetailsPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // _buildProductImagesWidgets(),
                _showImage(screenSize),
                const SizedBox(height: 12.0),

                _buildProductTitleWidget(),
                const SizedBox(height: 12.0),
                _buildPriceWidgets(),
                const SizedBox(height: 12.0),
                _buildSizeChartWidgets(),
                const SizedBox(height: 12.0),
                _buildStyleNoteHeader(),
                const SizedBox(height: 4.0),
                _buildStyleNoteData(),
                const SizedBox(height: 20.0),
                _buildMoreInfoHeader(),
                const SizedBox(height: 4.0),
                _buildMoreInfoData(),
                const SizedBox(height: 24.0),
                _buildBottomNavigationBar(context),
              ],
            ),
          ),
        ),
      ],
    );
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

  _showImage(Size screenSize) {
    return Image.asset(
      "assets/photo/adidas-alphabounce-beyond-release-details-3.jpg",
      width: screenSize.width,
    );
  }

  _buildProductTitleWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          //name,
          "Adidas Alphabounce",
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  _buildPriceWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Text(
            "\$${100}",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          const SizedBox(
            width: 8.0,
          ),
          const Text(
            "\$${10}",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            "${10}% Off",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.blue[700],
            ),
          ),
        ],
      ),
    );
  }

  _buildSizeChartWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.straighten,
                color: Colors.grey[600],
              ),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                "Size",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildStyleNoteHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "DECRIPTION",
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }

  _buildStyleNoteData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "The adidas Alphabounce is a new low-cut running shoe from adidas. It features a mix of full-length mesh, ribbed patterns, and Bounce foam cushioning. The shoe debuted on June 15th, 2016 for an MSRP of 100. Additional colorways released at select retailers on June 20th, 2016. Read the articles below for further release details and price information. ",
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }

  _buildMoreInfoHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "MORE INFO",
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }

  _buildMoreInfoData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "Product Code: ${100}\nTax info: Applicable GST will be charged at the time of chekout",
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
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
