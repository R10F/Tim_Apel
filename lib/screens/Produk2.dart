import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/produk_provider.dart';
import '../widgets/ProdukBuilder.dart';

class Produk extends StatefulWidget {
  const Produk({super.key});

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  final currency = NumberFormat.currency(locale: 'ID', symbol: 'Rp');
  @override
  Widget build(BuildContext context) {
    var produkProv = Provider.of<ProdukProvider>(context);
    List <String> kategori = produkProv.kategori;
    return
    TabBarView(
      children: <Widget>[
        ProdukBuilder(produk: produkProv.semuaProduk),
        for (int i=0; i<kategori.length; i++)
          ProdukBuilder(produk: produkProv.getProdukPerKategori(kategori[i]))
      ]
    );
  }
}
