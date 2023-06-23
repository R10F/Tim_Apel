import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/dashboard/home_insight.dart';
import 'package:tim_apel/screens/transaksi/dalam_proses/rincian_transaksi.dart';
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
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Figtree',
                    fontSize: 24),
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
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Figtree',
                    fontSize: 16),
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
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Figtree',
                  fontSize: 16),
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
                        backgroundColor: Colours.lightSalmon,
                        minimumSize: const Size(30, 30)),
                    onPressed: () {
                      transaksiProvider.createNewOrder(accountProvider.id);
                    },
                    child: Text(
                      "Buat Order Baru",
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium?.fontSize,
                          color: Colors.black),
                    )),
              ],
            ),
          ),
          accountProvider.getSetting('dashboard_minimal')
              ? Container()
              : HomeInsight(prov: transaksiProvider),
          Container(
            padding:
                const EdgeInsets.only(top: 20, bottom: 28, left: 4, right: 4),
            margin:
                const EdgeInsets.only(left: 20, right: 25, top: 30, bottom: 30),
            decoration: BoxDecoration(
              color: accountProvider.getSetting('dark_mode')
                  ? Colors.black54
                  : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 8),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Sedang Berlangsung",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                for (int i = 0; i < listTransaksi.length; i++)
                  if (listTransaksi[i].inProcess)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RincianTransaksi(
                                      idTransaksi: i,
                                      namaKasir: accountProvider
                                          .userAccounts[
                                              listTransaksi[i].idKasir]
                                          .nama,
                                      transaksi: listTransaksi[i],
                                    )));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Antrean ${listTransaksi[i].nomorAntrean}',
                                  style: const TextStyle(
                                      fontFamily: 'Figtree', fontSize: 18),
                                ),
                                Text(
                                  accountProvider
                                      .userAccounts[listTransaksi[i].idKasir]
                                      .nama,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontFamily: 'Figtree',
                                      fontSize: 16),
                                ),
                              ]),
                        ),
                      ),
                    ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                //   child: Container(
                //     alignment: Alignment.topLeft,
                //     child: const Text(
                //       "Tidak ada pesanan yang sedang berlangsung",
                //       style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: Colors.grey,
                //           fontFamily: 'Figtree',
                //           fontSize: 16),
                //       textAlign: TextAlign.start,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 20.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Baru Diselesaikan",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 26),
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
