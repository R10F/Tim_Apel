// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tim_apel/utilities/formatting.dart';

class ItemRincianBelanja extends StatefulWidget {
  const ItemRincianBelanja({super.key, required this.produk});

  final produk;

  @override
  State<ItemRincianBelanja> createState() => _ItemRincianBelanjaState();
}

class _ItemRincianBelanjaState extends State<ItemRincianBelanja> {
  @override
  Widget build(BuildContext context) {
    var produk = widget.produk;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(children: [
        Row(children: [
          Expanded(
              flex: 1,
              child: Text('3x',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.teal[500], fontSize: 24))),
          Expanded(
              flex: 5,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(produk.nama, style: const TextStyle(fontSize: 18)),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(top: 16)),
                          minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                        ),
                        child: const DefaultTextStyle(
                            style: TextStyle(
                                color: Colors.teal, fontSize: 14, fontWeight: FontWeight.w500),
                            child: Text('EDIT'))),
                    TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.only(top: 16, left: 25)),
                          minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                        ),
                        child: const DefaultTextStyle(
                            style: TextStyle(
                                color: Colors.red, fontSize: 14, fontWeight: FontWeight.w500),
                            child: Text('BATAL')))
                  ],
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
                      child: Text(currency(produk.hargaJual * 5),
                          style: const TextStyle(fontSize: 16)),
                    ),
                    Text('@ ${currency(produk.hargaJual)}',
                        style: const TextStyle(color: Colors.grey))
                  ],
                ),
              ))
        ]),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Divider(height: 15, thickness: 2),
        )
      ]),
    );
  }
}