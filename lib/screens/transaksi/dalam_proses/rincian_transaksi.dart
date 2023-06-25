import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/payment/payment_list.dart';
import 'package:tim_apel/screens/transaksi/dalam_proses/item_rincian_belanja.dart';
import 'package:tim_apel/utilities/formatting.dart';

class RincianTransaksi extends StatefulWidget {
  const RincianTransaksi(
      {super.key, required this.idTransaksi, required this.transaksi, required this.namaKasir});

  final int idTransaksi;
  final Transaksi transaksi;
  final String namaKasir;

  @override
  State<RincianTransaksi> createState() => _RincianTransaksiState();
}

class _RincianTransaksiState extends State<RincianTransaksi> {
  @override
  Widget build(BuildContext context) {
    var produkProvider = Provider.of<ProdukProvider>(context);
    var transaksiProvider = Provider.of<TransaksiProvider>(context);
    List keranjang =
        transaksiProvider.listTransaksi[widget.idTransaksi].keranjang(produkProvider.semuaProduk);
    int totalHargaBelanja = widget.transaksi.totalHargaBelanja(produkProvider.semuaProduk);

    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Transaksi')),
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
                Expanded(flex: 5, child: Text(': Dalam Proses'))
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 3, child: Text('Total Belanja')),
                Expanded(flex: 5, child: Text(': ${currency(totalHargaBelanja)}'))
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Column(
                    children: List.generate(
                        keranjang.length,
                        (index) => ItemRincianBelanja(
                            idTransaksi: widget.idTransaksi, data: keranjang[index]))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 25),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Total Belanja', style: TextStyle(fontSize: 18)),
                Text(currency(totalHargaBelanja),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600))
              ]),
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
                  child: Text(
                    'Pilih metode pembayaran',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (_) => PaymentList(
                                idTransaksi: widget.idTransaksi,
                                totalHarga: totalHargaBelanja,
                                nomorAntrean: widget.transaksi.nomorAntrean)));
                  },
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
