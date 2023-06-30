import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/utilities/formatting.dart';
import 'package:tim_apel/models/produk_data_model.dart';
import 'package:tim_apel/screens/produk/detail_produk.dart';
import 'package:tim_apel/screens/produk/popup_menu.dart';

class ProdukBuilder extends StatefulWidget {
  final List<Produk> produk;
  const ProdukBuilder({super.key, required this.produk});

  @override
  State<ProdukBuilder> createState() => _ProdukBuilderState();
}

class _ProdukBuilderState extends State<ProdukBuilder> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    var transaksiProvider = Provider.of<TransaksiProvider>(context);

    return GridView.count(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 40),
        crossAxisCount: 2,
        childAspectRatio:
            (MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.05)),
        children: [
          for (int i = 0; i < widget.produk.length; i++)
            if (widget.produk[i].stok > 0 && !widget.produk[i].isDeleted)
              Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Card(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailProduk(
                                  idTransaksi: transaksiProvider.selectedAntrean,
                                  produk: widget.produk[i])));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        widget.produk[i].gambar.contains('assets')
                            ? Image.asset(widget.produk[i].gambar)
                            : Image.file(File(widget.produk[i].gambar)),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: accountProvider.isOwner
                                  ? [
                                      Flexible(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            widget.produk[i].nama,
                                            style: const TextStyle(
                                                fontFamily: 'Figtree', fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                          offset: const Offset(12.5, 0),
                                          child: PopupMenu(idxProduk: widget.produk[i].id)),
                                    ]
                                  : [
                                      Flexible(
                                        child: Padding(
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
                                      ),
                                    ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 8),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '@ ${currency(widget.produk[i].hargaJual)}',
                              style: TextStyle(
                                  fontFamily: 'Figtree', fontSize: 14, color: Colors.teal[500]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, left: 8),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Stok: ${widget.produk[i].stok} item',
                              style: const TextStyle(fontFamily: 'Figtree', fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )))
        ]);
  }
}
