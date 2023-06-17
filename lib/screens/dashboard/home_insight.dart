import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tim_apel/utilities/formatting.dart';

class SalesData {
  String? dateTime;
  int sales;

  SalesData(int year, int month, this.sales) {
    dateTime = DateFormat.MMM().format(DateTime(year, month));
  }
}

class HomeInsight extends StatefulWidget {
  const HomeInsight({super.key});

  @override
  State<HomeInsight> createState() => _HomeInsightState();
}

class _HomeInsightState extends State<HomeInsight> {
  String date = DateFormat.d().format(DateTime.now());
  String month = DateFormat.MMM().format(DateTime.now());
  String year = DateFormat.y().format(DateTime.now());

  final _tooltipBehavior = TooltipBehavior(
    enable: true,
    activationMode: ActivationMode.singleTap,
  );

  late List<SalesData> chartData = generateSalesData();

  List<SalesData> generateSalesData() {
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;

    if (currentMonth <= 12) {
      currentMonth = 12 - (12 - currentMonth) + 1;
      currentYear -= 1;
    }

    List<SalesData> data = List<SalesData>.generate(11, (index) {
      if (currentMonth > 12) {
        currentMonth = 1;
        currentYear += 1;
      }
      return SalesData(currentYear, currentMonth++, (Random().nextInt(20) + 10) * 50000);
    });
    data.add(SalesData(DateTime.now().year, DateTime.now().month, 500000));

    return data;
  }

  @override
  Widget build(BuildContext context) {
    // var accountProvider = Provider.of<AccountProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 20),
          child: Text(
            "Insight Harian - $date $month $year",
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
                    color: Colors.white,
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
                        currency(125000),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      'Omzet (Rp)',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ]))),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(left: 8, right: 25, bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                        currency(75000),
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
                    color: Colors.white,
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
                  child: const Column(children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        '25',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Produk Terjual',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ]))),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(left: 8, right: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                  child: const Column(children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Jumlah Transaksi',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ])))
        ]),
        Container(
          padding: const EdgeInsets.only(top: 20, bottom: 4, left: 4, right: 4),
          margin: const EdgeInsets.only(left: 20, right: 25, top: 30),
          decoration: BoxDecoration(
            color: Colors.white,
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
                        textAlign: TextAlign.start,
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
                    tooltipBehavior: _tooltipBehavior,
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
