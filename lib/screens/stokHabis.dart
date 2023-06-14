import 'package:flutter/material.dart';

class StokHabis extends StatefulWidget {
  const StokHabis({super.key});

  @override
  State<StokHabis> createState() => _StokHabisState();
}

class _StokHabisState extends State<StokHabis> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Row(
                children: [
                  Image.asset(
                    "assets/product_images/produk_1.jpg",
                    width: 125,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Lem Kertas Kenko \nUk. Besar ",
                          style: TextStyle(fontSize: 16, fontFamily: 'Figtree'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Restock",
                              style: TextStyle(color: Colors.teal[500]),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Row(
                children: [
                  Image.asset(
                    "assets/product_images/produk_1.jpg",
                    width: 125,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Lem Kertas Kenko \nUk. Besar ",
                          style: TextStyle(fontSize: 16, fontFamily: 'Figtree'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Restock",
                              style: TextStyle(color: Colors.teal[500]),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Row(
                children: [
                  Image.asset(
                    "assets/product_images/produk_1.jpg",
                    width: 125,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Lem Kertas Kenko \nUk. Besar ",
                          style: TextStyle(fontSize: 16, fontFamily: 'Figtree'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Restock",
                              style: TextStyle(color: Colors.teal[500]),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
