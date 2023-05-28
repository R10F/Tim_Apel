import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/widgets/ProdukBuilder.dart';
import 'package:tim_apel/widgets/TabNavigasiProduk.dart';
import 'package:tim_apel/widgets/TabNavigasiTransaksi.dart';
import 'package:tim_apel/providers/bottomNavbar_provider.dart';

import '../models/produk_data_model.dart';
import '../providers/produk_provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var produkProv = Provider.of<ProdukProvider>(context);

    List<Produk> matchQuery = [];

    for (var i = 0; i < produkProv.semuaProduk.length; i++) {
      if (produkProv.semuaProduk[i].nama
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())) {
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
      if (produkProv.semuaProduk[i].nama
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())) {
        matchQuery.add(produkProv.semuaProduk[i]);
      }
    }
    return ProdukBuilder(produk: matchQuery);
  }
}

class AppBarOwner extends StatelessWidget {
  const AppBarOwner({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomnavProvider = Provider.of<bottomNavbarProvider>(context);
    return AppBar(
        actions: [
          if (bottomnavProvider.getSelectedIdx == 1)
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: Icon(Icons.search))
        ],
        title: (bottomnavProvider.getSelectedIdx == 0)
            ? const Text(
                'Makmur App',
              )
            : (bottomnavProvider.getSelectedIdx == 1)
                ? const Text(
                    "Produk",
                  )
                : (bottomnavProvider.getSelectedIdx == 2)
                    ? const Text(
                        'Transaksi',
                      )
                    : const Text(
                        'Profile',
                      ),
        bottom: bottomnavProvider.getSelectedIdx == 1
            ? const PreferredSize(
                preferredSize: Size.fromHeight(kTextTabBarHeight),
                child: TabNavigasiProduk())
            : bottomnavProvider.getSelectedIdx == 2
                ? const PreferredSize(
                    preferredSize: Size.fromHeight(kTextTabBarHeight),
                    child: TabNavigasiTransaksi())
                : null);
  }
}
