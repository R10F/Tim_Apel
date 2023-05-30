import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/produk_data_model.dart';
import '../screens/DetailProduk.dart';

class ProdukBuilder extends StatefulWidget {
  final List<Produk> produk;
  const ProdukBuilder({super.key, required this.produk});

  @override
  State<ProdukBuilder> createState() => _ProdukBuilderState();
}

class _ProdukBuilderState extends State<ProdukBuilder> {
  final currency = NumberFormat.currency(locale: 'ID', symbol: 'Rp');

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 2,
        childAspectRatio: (156 / 250),
        children: [
          for (int i = 0; i < widget.produk.length; i++)
            Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Card(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                DetailProduk(produk: widget.produk[i])));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(widget.produk[i].gambar!),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.produk[i].nama,
                              style: const TextStyle(
                                  fontFamily: 'Figtree', fontSize: 16),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format(widget.produk[i].hargaJual),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )))
        ]);
  }
}
