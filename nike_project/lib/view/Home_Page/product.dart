import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/model/entity/product_item/product_item.dart';

class Product extends StatelessWidget {
  Product({Key? key, required this.listProduct}) : super(key: key);
  Future<List<ProductItem>> listProduct;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductItem>>(
      future: listProduct,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // return Wrap(
                //   children: [
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.greenAccent[100],
                  ),
                  child: SizedBox(
                    height: 220,
                    width: 180,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Image.network(
                              snapshot
                                  .data![index].details[0].images[0].urlImage,
                              height: 150,
                              width: 200,
                              fit: BoxFit.cover),
                        ),
                        Positioned(
                            top: 0,
                            left: 20,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite))),
                        Positioned(
                            bottom: 40,
                            left: 20,
                            child: Text(snapshot.data![index].product.name)),
                        Positioned(
                            bottom: 0,
                            left: 20,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // const Text("170"),
                                Text(
                                  snapshot.data![index].details[0].quantities[0]
                                          .price
                                          .toString() +
                                      "\$",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box))
                              ],
                            )),
                      ],
                    ),
                  ),
                );
                //)
                //   ],
                // );
              },
            ),
          );
          //Text(snapshot.data![0].product.name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
    // Column(
    //   children: [

    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.all(8.0),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20.0),
    //             color: Colors.greenAccent[100],
    //           ),
    //           child: SizedBox(
    //             height: 220,
    //             width: 180,
    //             child: Stack(
    //               alignment: AlignmentDirectional.center,
    //               children: [
    //                 Positioned(
    //                   top: 0,
    //                   left: 0,
    //                   child: Image.asset("assets/nike1.jpeg",
    //                       height: 150, width: 200, fit: BoxFit.cover),
    //                 ),
    //                 Positioned(
    //                     top: 0,
    //                     left: 20,
    //                     child: IconButton(
    //                         onPressed: () {},
    //                         icon: const Icon(Icons.favorite))),
    //                 const Positioned(
    //                     bottom: 40, left: 20, child: Text("Air-vanpomax")),
    //                 Positioned(
    //                     bottom: 0,
    //                     left: 20,
    //                     width: 150,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         // const Text("170"),
    //                         const Text(
    //                           "170",
    //                           style: TextStyle(fontWeight: FontWeight.w700),
    //                         ),
    //                         IconButton(
    //                             onPressed: () {},
    //                             icon: const Icon(Icons.add_box))
    //                       ],
    //                     )),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(8.0),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20.0),
    //             color: Colors.yellow[100],
    //           ),
    //           child: SizedBox(
    //             height: 220,
    //             width: 180,
    //             child: Stack(
    //               children: [
    //                 Positioned(
    //                   top: 0,
    //                   left: 0,
    //                   child: Image.asset("assets/nike2.png",
    //                       height: 150, width: 200, fit: BoxFit.cover),
    //                 ),
    //                 Positioned(
    //                     top: 0,
    //                     left: 20,
    //                     child: IconButton(
    //                         onPressed: () {},
    //                         icon: const Icon(Icons.favorite))),
    //                 const Positioned(
    //                     bottom: 40, left: 20, child: Text("Air-vanpomax")),
    //                 Positioned(
    //                     width: 150,
    //                     bottom: 0,
    //                     left: 20,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         const Text(
    //                           "170",
    //                           style: TextStyle(fontWeight: FontWeight.w700),
    //                         ),
    //                         IconButton(
    //                             onPressed: () {},
    //                             icon: const Icon(Icons.add_box))
    //                       ],
    //                     )),
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //     const SizedBox(
    //       height: 20,
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.all(8.0),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20.0),
    //             color: Colors.pink[50],
    //           ),
    //           child: SizedBox(
    //             height: 220,
    //             width: 180,
    //             child: Stack(
    //               children: [
    //                 Positioned(
    //                   top: 0,
    //                   left: 0,
    //                   child: Image.asset("assets/nike3.png",
    //                       height: 150, width: 200, fit: BoxFit.cover),
    //                 ),
    //                 Positioned(
    //                     top: 0,
    //                     left: 20,
    //                     child: IconButton(
    //                         onPressed: () {},
    //                         icon: const Icon(Icons.favorite))),
    //                 const Positioned(
    //                     bottom: 40, left: 20, child: Text("Air-vanpomax")),
    //                 Positioned(
    //                     width: 150,
    //                     bottom: 0,
    //                     left: 20,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         const Text(
    //                           "170",
    //                           style: TextStyle(fontWeight: FontWeight.w700),
    //                         ),
    //                         IconButton(
    //                             onPressed: () {},
    //                             icon: const Icon(Icons.add_box))
    //                       ],
    //                     )),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(8.0),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20.0),
    //             color: Colors.purple[50],
    //           ),
    //           child: SizedBox(
    //             height: 220,
    //             width: 180,
    //             child: Stack(
    //               children: [
    //                 Positioned(
    //                   top: 0,
    //                   left: 0,
    //                   child: Image.asset("assets/nike4.png",
    //                       height: 150, width: 200, fit: BoxFit.cover),
    //                 ),
    //                 Positioned(
    //                     top: 0,
    //                     left: 20,
    //                     child: IconButton(
    //                         onPressed: () {},
    //                         icon: const Icon(Icons.favorite))),
    //                 const Positioned(
    //                     bottom: 40, left: 20, child: Text("Air-vanpomax")),
    //                 Positioned(
    //                     width: 150,
    //                     bottom: 0,
    //                     left: 20,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         const Text(
    //                           "170",
    //                           style: TextStyle(fontWeight: FontWeight.w700),
    //                         ),
    //                         IconButton(
    //                             onPressed: () {},
    //                             icon: const Icon(Icons.add_box))
    //                       ],
    //                     )),
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //     const SizedBox(
    //       height: 20,
    //     ),
    //   ],
    // );
  }
}
