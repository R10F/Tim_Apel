import 'dart:math';

import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}

class _HomeState extends State<Home> {
  final _tooltipBehavior = TooltipBehavior(
    enable: true,
    activationMode: ActivationMode.singleTap,
  );

  final currency = NumberFormat.currency(locale: 'ID', symbol: 'Rp');

  String date = DateFormat.d().format(DateTime.now());
  String month = DateFormat.MMM().format(DateTime.now());
  String year = DateFormat.y().format(DateTime.now());

  late List<SalesData> chartData;

  List<SalesData> generateSalesData() {
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;

    if (currentMonth < 12) {
      currentMonth = 12 - currentMonth - 1;
      currentYear -= 1;
    }

    return List<SalesData>.generate(11, (index) {
      if (currentMonth > 12) {
        currentMonth = 1;
        currentYear += 1;
      }

      return SalesData(
          DateFormat.MMM().format(DateTime(currentYear, currentMonth++)),
          (Random().nextInt(20) + 10) * 50000);
    });
  }

  @override
  Widget build(BuildContext context) {
    chartData = generateSalesData();
    chartData.add(SalesData(
        DateFormat.MMM()
            .format(DateTime(DateTime.now().year, DateTime.now().month)),
        500000));

    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0, top: 10.0),
          child: Text(
            "Hai, Athalia!",
            style: TextStyle(
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Text(
                      "Profit Per Bulan",
                      style: TextStyle(
                        fontFamily: 'Figtree',
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(
                        labelFormat: "{value}", numberFormat: currency),
                    tooltipBehavior: _tooltipBehavior,
                    series: <ChartSeries>[
                      // Renders line chart
                      LineSeries<SalesData, String>(
                          name: 'Income',
                          dataSource: chartData,
                          markerSettings: const MarkerSettings(isVisible: true),
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales),
                    ]),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10.0),
          child: Text(
            "Insight Harian - $date $month $year",
            style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Card(
                  child: SizedBox(
                      width: 150,
                      height: 66,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Text(
                              currency.format(125000),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Center(
                            child: Text(
                              'Omzet (Rp)',
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Center(
                child: Card(
                  child: SizedBox(
                      width: 150,
                      height: 66,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Text(
                              currency.format(75000),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Center(
                            child: Text(
                              'Profit',
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Card(
                  child: SizedBox(
                      width: 150,
                      height: 66,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Text(
                              '25',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Produk Terjual',
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Center(
                child: Card(
                  child: SizedBox(
                      width: 150,
                      height: 66,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Jumlah Transaksi',
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
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
