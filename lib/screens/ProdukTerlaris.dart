import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/account_provider.dart';

class ProdukTerlaris extends StatefulWidget {
  const ProdukTerlaris({super.key});

  @override
  State<ProdukTerlaris> createState() => _ProdukTerlarisState();
}

class _ProdukTerlarisState extends State<ProdukTerlaris> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produk Terlaris"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Nama Produk',
                    suffixIcon: const Icon(Icons.search)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "ATK",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
            Padding(
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
                            "1",
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Lem Lilin Uk. Kecil",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "terjual: 100/bulan",
                            style: TextStyle(
                                fontSize: 15, color: Colors.green[500]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
