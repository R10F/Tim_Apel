import 'package:flutter/material.dart';
import 'package:tim_apel/screens/transaksi/card_transaksi.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CardTransaksi(),
    );
  }
}
