import 'package:flutter/material.dart';
import 'package:tim_apel/models/produk_data_model.dart';
import 'package:tim_apel/utilities/formatting.dart';

class ItemRincianBelanja extends StatefulWidget {
  const ItemRincianBelanja({super.key, required this.idTransaksi, required this.data});

  final int idTransaksi;
  final dynamic data;

  @override
  State<ItemRincianBelanja> createState() => _ItemRincianBelanjaState();
}

class _ItemRincianBelanjaState extends State<ItemRincianBelanja> {
  @override
  Widget build(BuildContext context) {
    Produk produk = widget.data[0];
    int qty = widget.data[1];

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(children: [
        Row(children: [
          Expanded(
              flex: 1,
              child: Text('${qty}x',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.teal[500], fontSize: 24))),
          Expanded(
              flex: 5,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(produk.nama, style: const TextStyle(fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(produk.kategori,
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500)),
                )
              ])),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(currency(produk.hargaJual * qty),
                          style: const TextStyle(fontSize: 16)),
                    ),
                    Text('@ ${currency(produk.hargaJual)}',
                        style: const TextStyle(color: Colors.grey))
                  ],
                ),
              ))
        ]),
        const Padding(
          padding: EdgeInsets.only(top: 4),
          child: Divider(height: 15, thickness: 2),
        )
      ]),
    );
  }
}
