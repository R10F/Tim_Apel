import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [
      Center(child: Text('Konten Transaksi Dalam Proses')),
      Center(child: Text('Konten Transaksi Sudah Selesai')),
    ]);
  }
}
