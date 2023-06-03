import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
  final currency = NumberFormat.currency(locale: 'ID', symbol: 'Rp');

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

      return SalesData(
          currentYear, currentMonth++, (Random().nextInt(20) + 10) * 50000);
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
                          xValueMapper: (SalesData sales, _) => sales.dateTime,
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
      ],
    );
  }
}
