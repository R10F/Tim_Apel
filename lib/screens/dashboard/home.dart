import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/dashboard/home_insight.dart';
import 'package:tim_apel/screens/dashboard/transaksi_baru_diselesaikan.dart';
import 'package:tim_apel/screens/dashboard/transaksi_sedang_berlangsung.dart';
import 'package:tim_apel/utilities/formatting.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    var transaksiProvider = Provider.of<TransaksiProvider>(context);
    var listTransaksi = transaksiProvider.listTransaksi;
    var listTransaksiSelesai = transaksiProvider.listTransaksiSelesaiHariIni;

    int totalPesanan = 0;
    int totalDikantongi = 0;
    for (int i = 0; i < listTransaksiSelesai.length; i++) {
      if (listTransaksiSelesai[i].idKasir == accountProvider.id) {
        int temp = listTransaksiSelesai[i].totalHargaBelanjaAkhir();
        totalDikantongi += temp;
        totalPesanan++;
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 25),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Hai, ${accountProvider.currentUser.nama}!',
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontFamily: 'Figtree', fontSize: 24),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'masih semangat jualan hari ini?',
                style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Figtree', fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Container(
          //     alignment: Alignment.topLeft,
          //     child: const Text(
          //       "Penjualan",
          //       style: TextStyle(
          //           fontWeight: FontWeight.w700, fontFamily: 'Plus Jakarta Sans', fontSize: 26),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Text(
              "Kamu telah menjual $totalPesanan pesanan. Total ${currency(totalDikantongi)} telah kamu kantongi! Lanjuut! ",
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Figtree', fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colours.lightSalmon, minimumSize: const Size(30, 30)),
                    onPressed: () {
                      transaksiProvider.createNewOrder(accountProvider.id);
                    },
                    child: Text(
                      "Buat Order Baru",
                      style: TextStyle(
                          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                          color: Colors.black),
                    )),
              ],
            ),
          ),
          accountProvider.getSetting('dashboard_minimal')
              ? Container()
              : HomeInsight(prov: transaksiProvider),
          TransaksiSedangBerlangsung(
              accountProvider: accountProvider, listTransaksi: listTransaksi),
          TransaksiBaruDiselesaikan(
              accountProvider: accountProvider, listTransaksi: listTransaksiSelesai),
        ],
      ),
    );
  }
}
