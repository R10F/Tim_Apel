import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/providers/search_laris_provider.dart';
import 'package:tim_apel/screens/admin/analisis_penjualan/produk_laris/item_laris.dart';

class LarisBuilder extends StatefulWidget {
  const LarisBuilder({super.key, required this.idAndQty});

  final List<List<int>> idAndQty;

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
          if (produkProv
              .getProdukById(widget.idAndQty[0][i])
              .nama
              .toString()
              .toLowerCase()
              .contains(searchProv.query.toLowerCase()))
            ItemLaris(
                produk: produkProv.getProdukById(widget.idAndQty[0][i]),
                qty: widget.idAndQty[1][i] == 0 ? 0 : -1 * widget.idAndQty[1][i],
                rank: i + 1),
      ],
    );
  }
}
