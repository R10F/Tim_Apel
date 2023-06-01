import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/produk_data_model.dart';
import '../providers/account_provider.dart';
import '../screens/DetailProduk.dart';
import 'PopupMenu.dart';

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
    var accountProvider = Provider.of<AccountProvider>(context);

    return GridView.count(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 2,
        childAspectRatio: (156 / 260),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: accountProvider.isOwner ?
                        <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  widget.produk[i].nama,
                                  style: const TextStyle(
                                      fontFamily: 'Figtree', fontSize: 16),
                                ),
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PopupMenu(),
                          ),
                        ] :
                        <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  widget.produk[i].nama,
                                  style: const TextStyle(
                                      fontFamily: 'Figtree', fontSize: 16),
                                ),
                              ),
                          ),
                        ]
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
