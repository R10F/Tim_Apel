import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/transaksi/card_transaksi.dart';

class ListTransaksi extends StatefulWidget {
  const ListTransaksi({super.key});

  @override
  State<ListTransaksi> createState() => _ListTransaksiState();
}

class _ListTransaksiState extends State<ListTransaksi> {
  @override
  Widget build(BuildContext context) {
    var transaksiProvider = Provider.of<TransaksiProvider>(context);
    List<TransaksiModel> listTransaksi = transaksiProvider.listTransaksi;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: TabBarView(children: [
        SingleChildScrollView(
          child: Column(
              children: List.generate(listTransaksi.length,
                  (index) => CardTransaksi(transaksi: listTransaksi[index]))),
        ),
        const Text('Konten ListTransaksi Sudah Selesai'),
      ]),
    );
  }
}
