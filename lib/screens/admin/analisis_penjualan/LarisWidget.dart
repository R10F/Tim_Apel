import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/produk_data_model.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/providers/search_laris_provider.dart';

class LarisBuilder extends StatefulWidget {
  final List<List<int>> idAndQty;
  const LarisBuilder({super.key, required this.idAndQty});

  @override
  State<LarisBuilder> createState() => _LarisBuilderState();
}

class _LarisBuilderState extends State<LarisBuilder> {
  @override
  Widget build(BuildContext context) {
    var produkProv = Provider.of<ProdukProvider>(context);
    var searchProv = Provider.of<SearchLarisProvider>(context);

    return Column(
      children: [
        for (int i = 0; i < widget.idAndQty[0].length; i++)
          if (produkProv.getProdukById(widget.idAndQty[0][i]).nama.toString().toLowerCase().contains(searchProv.query.toLowerCase()))
          LarisWidget(
              produk: produkProv.getProdukById(widget.idAndQty[0][i]),
              qty: widget.idAndQty[1][i] ==  0 ? 0 :  1* widget.idAndQty[1][i],
              rank: i+1),
      ],
    );
  }
}

class LarisWidget extends StatefulWidget {
  final Produk produk;
  final int qty;
  final int rank;
  const LarisWidget({super.key, required this.produk, required this.qty, required this.rank});

  @override
  State<LarisWidget> createState() => _LarisWidgetState();
}

class _LarisWidgetState extends State<LarisWidget> {
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
                    color: Colors.green[500],
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
                    style: TextStyle(fontSize: 15, color: Colors.green[500]),
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
