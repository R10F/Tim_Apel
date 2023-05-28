import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/produk_provider.dart';

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
        GridView.count(
          padding: const EdgeInsets.all(15),
          crossAxisCount: 2,
          childAspectRatio: (156 / 250),
          children: [
            for (int i=0; i<produkProv.semuaProduk.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('$produkProv.semuaProduk[i].gambar'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '$produkProv.semuaProduk[i].nama',
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            currency.format('$produkProv.semuaProduk[i].hargaJual'),
                            style: TextStyle(
                                fontFamily: 'Figtree',
                                fontSize: 14,
                                color: Colors.teal[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]
        ),    
        for (int i=0; i<kategori.length; i++)
          GridView.count(
            padding: const EdgeInsets.all(15),
            crossAxisCount: 2,
            childAspectRatio: (156 / 250),
            children: [
              for (int j=0; j<produkProv.getProdukPerKategori(kategori[i]).length; j++)
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child:
                Card(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('$produkProv.getProdukPerKategori(kategori[i])[j].gambar'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '$produkProv.getProdukPerKategori(kategori[i])[j].nama',
                              style:
                                  TextStyle(fontFamily: 'Figtree', fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              currency.format('$produkProv.getProdukPerKategori(kategori[i])[j].hargaJual'),
                              style: TextStyle(
                                  fontFamily: 'Figtree',
                                  fontSize: 14,
                                  color: Colors.teal[500]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]
          )
      ]
    );
  }
}
