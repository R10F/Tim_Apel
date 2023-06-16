// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tim_apel/screens/payment/payment_done.dart';
import 'package:tim_apel/screens/payment/pembayaran_tunai.dart';

class ItemMetodePembayaran extends StatelessWidget {
  ItemMetodePembayaran(
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
              child: Text(
                'Total Pembayaran',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text('Rp 20.500',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.green)),
            ),
            metodePembayaran == 'Tunai'
                ? const PembayaranTunai()
                : Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Text(
                          'Silahkan Scan Kode QR di bawah ini',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      QrImageView(
                        data: 'Pembayaran $metodePembayaran sebesar Rp 20.500',
                        version: QrVersions.auto,
                        size: 250,
                        embeddedImage:
                            AssetImage("assets/payment/$iconName-logo.png"),
                        embeddedImageStyle:
                            const QrEmbeddedImageStyle(size: Size(50, 50)),
                      ),
                    ],
                  ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[700]),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (_) => const PaymentDone()));
                      },
                      child: const Text(
                        'Konfirmasi Pembayaran',
                        style: TextStyle(fontFamily: 'Figtree', fontSize: 16),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
