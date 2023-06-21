import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/screens/transaksi/selesai/item_rincian_belanja.dart';
import 'package:tim_apel/utilities/formatting.dart';

class RincianTransaksi extends StatefulWidget {
  const RincianTransaksi(
      {super.key, required this.index, required this.transaksi, required this.namaKasir});

  final int index;
  final Transaksi transaksi;
  final String namaKasir;

  @override
  State<RincianTransaksi> createState() => _RincianTransaksiState();
}

class _RincianTransaksiState extends State<RincianTransaksi> {
  @override
  Widget build(BuildContext context) {
    var produkProvider = Provider.of<ProdukProvider>(context);
    var keranjang = widget.transaksi.keranjang(produkProvider.semuaProduk);

    return Scaffold(
      appBar: AppBar(title: const Text('Bon Faktur')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Row(
              children: [
                Expanded(flex: 3, child: Text('Status')),
                Expanded(flex: 5, child: Text(': Selesai'))
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 3, child: Text('Total Belanja')),
                Expanded(
                    flex: 5,
                    child: Text(
                        ': ${currency(widget.transaksi.totalHargaBelanja(produkProvider.semuaProduk))}'))
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 3, child: Text('Metode Pembayaran')),
                Expanded(flex: 5, child: Text(": ${widget.transaksi.metodePembayaran}"))
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 3, child: Text('Tanggal')),
                Expanded(
                    flex: 5, child: Text(": 20-02-2015 10:41 ${widget.transaksi.metodePembayaran}"))
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Column(
                    children: List.generate(
                        keranjang.length,
                        (index) =>
                            ItemRincianBelanja(idTransaksi: widget.index, data: keranjang[index]))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
                    child: const Text('Cetak bon'),
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: 'Pencetakan bon sedang diproses',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.teal[300],
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    },
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
