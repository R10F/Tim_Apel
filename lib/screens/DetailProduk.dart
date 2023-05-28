import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/produk_data_model.dart';

class DetailProduk extends StatefulWidget {
  final Produk produk;
  const DetailProduk({super.key, required this.produk});

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  final currency = NumberFormat.currency(locale: 'ID', symbol: 'Rp');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Produk")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(widget.produk.gambar!),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.produk.nama),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('@' + widget.produk.hargaJual.toString()),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jumlah"),
                    Text('1'), //bakal jadi qty input
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal"),
                    Text(currency.format(widget.produk.hargaJual * 1)), //bakal dikali qty input
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: (){
                
                    },
                    child: Text("Add to Cart")
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}