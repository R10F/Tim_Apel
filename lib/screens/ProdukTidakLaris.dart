import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/account_provider.dart';

class ProdukTidakLaris extends StatefulWidget {
  const ProdukTidakLaris({super.key});

  @override
  State<ProdukTidakLaris> createState() => _ProdukTidakLarisState();
}

class _ProdukTidakLarisState extends State<ProdukTidakLaris> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produk Tidak Laris"),
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
                            color: Colors.red[800],
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
                            "terjual: 0/bulan",
                            style:
                                TextStyle(fontSize: 15, color: Colors.red[600]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "total terjual : 10",
                            style:
                                TextStyle(fontSize: 14, color: Colors.red[600]),
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
