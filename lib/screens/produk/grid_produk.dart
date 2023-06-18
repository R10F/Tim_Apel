import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/screens/produk/produk_builder.dart';

class GridProduk extends StatefulWidget {
  const GridProduk({super.key});

  @override
  State<GridProduk> createState() => _GridProdukState();
}

class _GridProdukState extends State<GridProduk> {
  @override
  Widget build(BuildContext context) {
    var produkProvider = Provider.of<ProdukProvider>(context);
    List<String> kategori = produkProvider.kategori;

    return TabBarView(children: [
      ProdukBuilder(produk: produkProvider.semuaProduk),
      for (int i = 0; i < kategori.length; i++)
        ProdukBuilder(produk: produkProvider.getProdukPerKategori(kategori[i]))
    ]);
  }
}
