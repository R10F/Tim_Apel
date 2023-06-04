// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tim_apel/screens/pembayaran/transaksi_berhasil.dart';
import 'package:tim_apel/screens/pembayaran/tunai.dart';

class ItemPembayaran extends StatelessWidget {
  ItemPembayaran(
      {super.key, required this.metodePembayaran, required this.iconName});

  final String metodePembayaran;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(metodePembayaran),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text('Total Pembayaran', textAlign: TextAlign.center),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text('Rp 20.500',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.green)),
            ),
            metodePembayaran == 'Tunai'
                ? Tunai()
                : Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text(
                          'Silahkan Scan Kode QR di bawah ini',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(
                        'assets/pembayaran/$iconName.png',
                        width: 100,
                      ),
                    ],
                  ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const TransaksiBerhasil()));
                      },
                      child: const Text('Konfirmasi Pembayaran')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
