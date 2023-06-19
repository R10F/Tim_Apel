import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/produk_data_model.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/screens/produk/produk_builder.dart';

class CustomProdukSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var produkProv = Provider.of<ProdukProvider>(context);

    List<Produk> matchQuery = [];

    for (var i = 0; i < produkProv.semuaProduk.length; i++) {
      if (produkProv.semuaProduk[i].nama.toString().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(produkProv.semuaProduk[i].nama);
      }
    }
    return ProdukBuilder(produk: matchQuery);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var produkProv = Provider.of<ProdukProvider>(context);

    List<Produk> matchQuery = [];

    for (var i = 0; i < produkProv.semuaProduk.length; i++) {
      if (produkProv.semuaProduk[i].nama.toString().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(produkProv.semuaProduk[i]);
      }
    }
    return ProdukBuilder(produk: matchQuery);
  }
}
