import 'package:flutter/material.dart';
import 'package:nike_project/model/entity/product_item/product_item.dart';

class ProductItemComponent extends StatefulWidget {
  final ProductItem productItem;

  const ProductItemComponent({Key? key, required this.productItem})
      : super(key: key);
  @override
  _ProductItemComponentState createState() => _ProductItemComponentState();
}

class _ProductItemComponentState extends State<ProductItemComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _animation;

  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 375), vsync: this);
    _animation = Tween(begin: 150.0, end: 260).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeOut));

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[200],
      child: Center(
        child: MouseRegion(
          onEnter: (value) {
            setState(() {
              _controller.forward();
            });
          },
          onExit: (value) {
            setState(() {
              _controller.reverse();
            });
          },
          child: Container(
            height: _animation.value,
            width: 150.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10.0,
                  ),
                  height: 130.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          widget.productItem.details[0].images[0].urlImage),
                    ),
                  ),
                ),
                Flexible(
                  child: AnimatedOpacity(
                    opacity: _animation.value == 260.0 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Text(
                              widget.productItem.product.name,
                              style: TextStyle(fontSize: 10.0),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text('\$50'),
                                      ),
                                      Flexible(
                                        child: Row(
                                          children: [
                                            starIcon(Colors.yellow[700]),
                                            starIcon(Colors.yellow[700]),
                                            starIcon(Colors.yellow[700]),
                                            starIcon(Colors.yellow[700]),
                                            starIcon(Colors.grey[200]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Material(
                                        color: Colors.grey[200],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Center(
                                            child: Icon(
                                              Icons.bookmark,
                                              size: 15.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: 130.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue[200]!,
                                    offset: Offset(0.0, 10.0),
                                    spreadRadius: -5.0,
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'View Detail',
                                      style: TextStyle(
                                          fontSize: 8.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Icon starIcon(Color? color) {
    return Icon(
      Icons.star,
      size: 10.0,
      color: color,
    );
  }
}
