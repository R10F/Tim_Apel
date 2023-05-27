import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: <Widget>[
      Center(child: Text('Konten Transaksi Belum Selesai')),
      Center(child: Text('Konten Transaksi Sudah Selesai')),
    ]);
  }
}
