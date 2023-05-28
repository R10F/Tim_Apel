import 'package:flutter/material.dart';

class CardTransaksi extends StatefulWidget {
  const CardTransaksi({super.key});

  @override
  State<CardTransaksi> createState() => _CardTransaksiState();
}

class _CardTransaksiState extends State<CardTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [Text('Order M'), Text('Total Belanja: Rp')],
            ),
            Container(
              child: const Text('Athalia'),
            )
          ],
        ),
      ),
    );
  }
}
