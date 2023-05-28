import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Produk extends StatefulWidget {
  const Produk({super.key});

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  final currency = NumberFormat.currency(locale: 'ID', symbol: 'Rp');
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        GridView.count(
          padding: const EdgeInsets.all(15),
          crossAxisCount: 2,
          childAspectRatio: (156 / 250),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_1.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Lem Kertas Kenko Uk. Besar",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(10000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_1.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: const Text(
                            "Lem Kertas Kenko Uk. Kecil",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(5000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_2.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Lem Lilin Uk. Kecil",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(1000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_2.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Lem Lilin Uk. Besar",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(3000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_3.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Set Jarum Jahit",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(8000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_4.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Meteran Kain",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(4000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_5.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Pita Satin Meteran 0.5 cm Merah",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(500),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_5.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Pita Satin Roll 1 cm Merah",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(10000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        GridView.count(
          padding: const EdgeInsets.all(15),
          crossAxisCount: 2,
          childAspectRatio: (156 / 250),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_1.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Lem Kertas Kenko Uk. Besar",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(10000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_1.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Lem Kertas Kenko Uk. Kecil",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(5000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        GridView.count(
          padding: const EdgeInsets.all(15),
          crossAxisCount: 2,
          childAspectRatio: (156 / 250),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_2.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Lem Lilin Uk. Kecil",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(1000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_2.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Lem Lilin Uk. Besar",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(3000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        GridView.count(
          padding: const EdgeInsets.all(15),
          crossAxisCount: 2,
          childAspectRatio: (156 / 250),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_3.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Set Jarum Jahit",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(8000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_4.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Meteran Kain",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(4000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        GridView.count(
          padding: const EdgeInsets.all(15),
          crossAxisCount: 2,
          childAspectRatio: (156 / 250),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_5.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Pita Satin Meteran 0.5 cm Merah",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(500),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/product_images/produk_5.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Pita Satin Roll 1 cm Merah",
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(10000),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
