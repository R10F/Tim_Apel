import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/dashboard/home_insight.dart';
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

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Hai, ${accountProvider.currentUser.nama}!\nmasih semangat jualan hari ini?',
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontFamily: 'Figtree', fontSize: 20),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Penjualan",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontFamily: 'Plus Jakarta Sans', fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Kamu telah menjual 1 pesanan. Total ${currency(125000)} telah kamu kantongi! Lanjuut! ",
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
                    child: const Text(
                      "Buat Order Baru",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          ),
          accountProvider.getSetting('dashboard_minimal') ? Container() : const HomeInsight(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Sedang Berlangsung",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontFamily: 'Plus Jakarta Sans', fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Tidak ada pesanan yang sedang berlangsung",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontFamily: 'Figtree',
                    fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 20.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Baru Diselesaikan",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontFamily: 'Plus Jakarta Sans', fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 20),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Tidak ada pesanan yang baru diselesaikan",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontFamily: 'Figtree',
                    fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
