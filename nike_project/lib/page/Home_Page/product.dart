import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
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
                      child: Image.asset("assets/nike1.jpeg",
                          height: 150, width: 200, fit: BoxFit.cover),
                    ),
                    Positioned(
                        top: 0,
                        left: 20,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite))),
                    const Positioned(
                        bottom: 40, left: 20, child: Text("Air-vanpomax")),
                    Positioned(
                        bottom: 0,
                        left: 20,
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // const Text("170"),
                            const Text(
                              "170",
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
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.yellow[100],
              ),
              child: SizedBox(
                height: 220,
                width: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset("assets/nike2.png",
                          height: 150, width: 200, fit: BoxFit.cover),
                    ),
                    Positioned(
                        top: 0,
                        left: 20,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite))),
                    const Positioned(
                        bottom: 40, left: 20, child: Text("Air-vanpomax")),
                    Positioned(
                        width: 150,
                        bottom: 0,
                        left: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "170",
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
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.pink[50],
              ),
              child: SizedBox(
                height: 220,
                width: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset("assets/nike3.png",
                          height: 150, width: 200, fit: BoxFit.cover),
                    ),
                    Positioned(
                        top: 0,
                        left: 20,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite))),
                    const Positioned(
                        bottom: 40, left: 20, child: Text("Air-vanpomax")),
                    Positioned(
                        width: 150,
                        bottom: 0,
                        left: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "170",
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
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.purple[50],
              ),
              child: SizedBox(
                height: 220,
                width: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset("assets/nike4.png",
                          height: 150, width: 200, fit: BoxFit.cover),
                    ),
                    Positioned(
                        top: 0,
                        left: 20,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite))),
                    const Positioned(
                        bottom: 40, left: 20, child: Text("Air-vanpomax")),
                    Positioned(
                        width: 150,
                        bottom: 0,
                        left: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "170",
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
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
