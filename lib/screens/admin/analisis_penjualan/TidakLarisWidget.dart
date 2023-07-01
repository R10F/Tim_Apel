import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/produk_data_model.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/produk_provider.dart';

class TidakLarisBuilder extends StatefulWidget {
  final List<List<int>> idAndQty;
  const TidakLarisBuilder({super.key, required this.idAndQty});

  @override
  State<TidakLarisBuilder> createState() => _TidakLarisBuilderState();
}

class _TidakLarisBuilderState extends State<TidakLarisBuilder> {
  @override
  Widget build(BuildContext context) {
    var produkProv = Provider.of<ProdukProvider>(context);

    return Column(
      children: [
        for (int i = 0; i < widget.idAndQty[0].length; i++)
          TidakLarisWidget(
              produk: produkProv.getProdukById(widget.idAndQty[0][i]),
              qty: widget.idAndQty[1][i],
              allTimeQty: widget.idAndQty[2][i],
              rank: i+1),
      ],
    );
  }
}

class TidakLarisWidget extends StatefulWidget {
  final Produk produk;
  final int qty;
  final int allTimeQty;
  final int rank;
  const TidakLarisWidget({super.key, required this.produk, required this.qty, required this.allTimeQty, required this.rank});

  @override
  State<TidakLarisWidget> createState() => _TidakLarisWidgetState();
}

class _TidakLarisWidgetState extends State<TidakLarisWidget> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    widget.rank.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: accountProvider.getSetting('dark_mode')
                          ? Colors.black
                          : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.produk.nama,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "terjual: ${widget.qty.toString()}/bulan",
                    style: TextStyle(fontSize: 15, color: Colors.red[600]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "total terjual : ${widget.allTimeQty.toString()}",
                    style: TextStyle(fontSize: 14, color: Colors.red[600]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
