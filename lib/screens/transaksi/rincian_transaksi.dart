import 'package:flutter/material.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/utilities/formatting.dart';

class RincianTransaksi extends StatefulWidget {
  const RincianTransaksi({super.key, required this.transaksi, required this.namaKasir});

  final TransaksiModel transaksi;
  final String namaKasir;

  @override
  State<RincianTransaksi> createState() => _RincianTransaksiState();
}

class _RincianTransaksiState extends State<RincianTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Transaksi')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(flex: 3, child: Text('Nomor Antrean')),
                Expanded(flex: 5, child: Text(': ${widget.transaksi.nomorAntrean}'))
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 3, child: Text('Nama Kasir')),
                Expanded(flex: 5, child: Text(': ${widget.namaKasir}'))
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 3, child: Text('Status')),
                Expanded(
                    flex: 5,
                    child: Text(": ${widget.transaksi.inProcess ? 'Dalam Proses' : 'Selesai'}"))
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 3, child: Text('Total Belanja')),
                Expanded(flex: 5, child: Text(': ${currency(widget.transaksi.totalBelanja)}'))
              ],
            ),
            widget.transaksi.metodePembayaran != 'x'
                ? Row(
                    children: [
                      const Expanded(flex: 3, child: Text('Metode Pembayaran')),
                      Expanded(flex: 5, child: Text(": ${widget.transaksi.metodePembayaran}"))
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
