import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/transaksi/dalam_proses/card_transaksi_dalam_proses.dart';
import 'package:tim_apel/screens/transaksi/selesai/card_transaksi_selesai.dart';

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

    Map<String, List> groupbyDatetime = {};
    for (int i = 0; i < listTransaksi.length; i++) {
      if (!listTransaksi[i].inProcess) {
        String key = listTransaksi[i].date;
        groupbyDatetime.putIfAbsent(key, () => []);
        groupbyDatetime[key]?.add(listTransaksi[i]);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: TabBarView(children: [
        SingleChildScrollView(
          child: Column(
              children: List.generate(
                  listTransaksi.length,
                  (index) => listTransaksi[index].inProcess
                      ? CardTransaksiDalamProses(
                          index: index,
                          transaksi: listTransaksi[index],
                          namaKasir:
                              accountProvider.userAccounts[listTransaksi[index].idKasir].nama,
                          prov: transaksiProvider)
                      : Container())),
        ),
        SingleChildScrollView(
            child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text('Klik untuk melihat detail transaksi.'),
          ),
          ...groupbyDatetime.entries.map((entry) {
            String key = entry.key;
            List value = entry.value;

            return Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(key),
              ),
              for (int i = 0; i < value.length; i++)
                CardTransaksiSelesai(
                    index: i,
                    transaksi: value[i],
                    namaKasir: accountProvider.userAccounts[value[i].idKasir].nama,
                    prov: transaksiProvider)
            ]);
          })
        ]))
      ]),
    );
  }
}
