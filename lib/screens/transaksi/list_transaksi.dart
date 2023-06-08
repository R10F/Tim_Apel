import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/providers/account_provider.dart';
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
    var accountProvider = Provider.of<AccountProvider>(context);
    var transaksiProvider = Provider.of<TransaksiProvider>(context);
    List<Transaksi> listTransaksi = transaksiProvider.listTransaksi;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: TabBarView(children: [
        SingleChildScrollView(
          child: Column(
              children: List.generate(
                  listTransaksi.length,
                  (index) => CardTransaksi(
                      index: index,
                      transaksi: listTransaksi[index],
                      namaKasir: accountProvider.userAccounts[listTransaksi[index].idKasir].nama,
                      prov: transaksiProvider))),
        ),
        const Text('Konten ListTransaksi Sudah Selesai'),
      ]),
    );
  }
}
