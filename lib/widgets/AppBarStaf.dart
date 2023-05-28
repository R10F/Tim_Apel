import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/bottomNavbar_provider.dart';

import '../models/produk_data_model.dart';
import '../providers/produk_provider.dart';
import 'ProdukBuilder.dart';
import 'TabNavigasiProduk.dart';
import 'TabNavigasiTransaksi.dart';

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

class AppBarStaf extends StatelessWidget {
  const AppBarStaf({super.key});

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
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 48,
                    width: 48,
                  ),
                ],
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
