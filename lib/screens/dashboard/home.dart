import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/screens/dashboard/home_insight.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final currency = NumberFormat.currency(locale: 'ID', symbol: 'Rp');

  // String date = DateFormat.d().format(DateTime.now());
  // String month = DateFormat.MMM().format(DateTime.now());
  // String year = DateFormat.y().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10.0),
          child: Text(
            "Hai, ${accountProvider.currentUser['nama']}!",
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Figtree',
                fontSize: 20),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "masih semangat jualan hari ini?",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Figtree',
                fontSize: 20),
            textAlign: TextAlign.start,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0, top: 20.0),
          child: Text(
            "Penjualan",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 26),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Kamu telah menjual 1 pesanan. Total ${currency.format(125000)} telah kamu kantongi! Lanjuut! ",
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Figtree',
                fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colours.lightSalmon,
                      minimumSize: const Size(30, 30)),
                  onPressed: () {},
                  child: const Text(
                    "Buat Order Baru",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
        accountProvider.getSetting('dashboard_minimal')
            ? Container()
            : HomeInsight(),
        const Padding(
          padding: EdgeInsets.only(left: 15.0, top: 10.0),
          child: Text(
            "Sedang Berlangsung",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 26),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Tidak ada pesanan yang sedang berlangsung",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontFamily: 'Figtree',
                fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0, top: 25.0),
          child: Text(
            "Baru Diselesaikan",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 26),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Tidak ada pesanan yang baru diselesaikan",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontFamily: 'Figtree',
                fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
