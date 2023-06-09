// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/utilities/datetime.dart';
import 'package:tim_apel/utilities/formatting.dart';
import 'package:tim_apel/providers/account_provider.dart';

class SalesData {
  String? dateTime;
  int sales;

  SalesData(int year, int month, this.sales) {
    dateTime = DateFormat.MMM().format(DateTime(year, month));
  }
}

class HomeInsight extends StatefulWidget {
  const HomeInsight({super.key, required this.prov});

  final prov;

  @override
  State<HomeInsight> createState() => _HomeInsightState();
}

class _HomeInsightState extends State<HomeInsight> {
  @override
  Widget build(BuildContext context) {
    var produkProvider = Provider.of<ProdukProvider>(context);
    var accountProvider = Provider.of<AccountProvider>(context);
    var transaksiProvider = widget.prov;

    List listTransaksiSelesai = transaksiProvider.listTransaksiSelesaiHariIni;

    int omzet = 0;
    int profit = 0;
    int produkTerjual = 0;
    int jumlahTransaksi = listTransaksiSelesai.length;

    for (int i = 0; i < listTransaksiSelesai.length; i++) {
      var currentTransaksi = listTransaksiSelesai[i];

      int tempOmzet = currentTransaksi.totalHargaBelanjaAkhir();
      omzet += tempOmzet;

      int tempProdukTerjual = currentTransaksi.keranjangItemCount(produkProvider.semuaProduk);
      produkTerjual += tempProdukTerjual;

      for (int i = 0; i < currentTransaksi.listProdukAkhir.length; i++) {
        int temp = (currentTransaksi.listProdukAkhir[i][0].hargaJual -
                currentTransaksi.listProdukAkhir[i][0].hargaBeli) *
            currentTransaksi.listProdukAkhir[i][1];
        profit += temp;
      }
    }

    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;

    if (currentMonth <= 12) {
      currentMonth = 12 - (12 - currentMonth) + 1;
      currentYear -= 1;
    }

    List<SalesData> chartData = List<SalesData>.generate(11, (index) {
      if (currentMonth > 12) {
        currentMonth = 1;
        currentYear += 1;
      }
      return SalesData(currentYear, currentMonth++, (Random().nextInt(20) + 10) * 50000);
    });
    chartData.add(SalesData(DateTime.now().year, DateTime.now().month, 500000 + omzet));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 20),
          child: Text(
            "Insight Harian - ${getTodayDate()}",
            style: const TextStyle(
                fontSize: 20, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w500),
          ),
        ),
        Row(children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(left: 20, right: 8, bottom: 16),
                  decoration: BoxDecoration(
                    color: accountProvider.getSetting('dark_mode') ? Colors.black54 : Colors.white,
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
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        currency(omzet),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      'Omzet',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ]))),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(left: 8, right: 20, bottom: 16),
                  decoration: BoxDecoration(
                    color: accountProvider.getSetting('dark_mode') ? Colors.black54 : Colors.white,
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
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        currency(profit),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      'Profit',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ])))
        ]),
        Row(children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(left: 20, right: 8),
                  decoration: BoxDecoration(
                    color: accountProvider.getSetting('dark_mode') ? Colors.black54 : Colors.white,
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
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        produkTerjual.toString(),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      'Produk Terjual',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ]))),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(left: 8, right: 20),
                  decoration: BoxDecoration(
                    color: accountProvider.getSetting('dark_mode') ? Colors.black54 : Colors.white,
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
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        jumlahTransaksi.toString(),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      'Jumlah Transaksi',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ])))
        ]),
        Container(
          padding: const EdgeInsets.only(top: 20, bottom: 4, left: 4, right: 4),
          margin: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 15),
          decoration: BoxDecoration(
            color: accountProvider.getSetting('dark_mode') ? Colors.black54 : Colors.white,
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        "Profit Bulanan",
                        style: TextStyle(
                          fontFamily: 'Figtree',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(labelFormat: "{value}", numberFormat: currencyFormat),
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      activationMode: ActivationMode.singleTap,
                    ),
                    series: <ChartSeries>[
                      // Renders line chart
                      LineSeries<SalesData, String>(
                          name: 'Income',
                          dataSource: chartData,
                          markerSettings: const MarkerSettings(isVisible: true),
                          xValueMapper: (SalesData sales, _) => sales.dateTime,
                          yValueMapper: (SalesData sales, _) => sales.sales),
                    ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
