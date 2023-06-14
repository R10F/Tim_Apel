import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/stokProduk_provider.dart';

class StokProduk extends StatefulWidget {
  const StokProduk({super.key});

  @override
  State<StokProduk> createState() => _StokProdukState();
}

class _StokProdukState extends State<StokProduk> {
  @override
  Widget build(BuildContext context) {
    var stokProdukProv = Provider.of<StokProdukProvider>(context);
    var filteredStokProduk = stokProdukProv.getStokProduk;
    return Scaffold(
        appBar: AppBar(
          title: Text("Segera Restock"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilterChip(
                    label: Text("Segera Habis"),
                    selected: stokProdukProv.getStatusSegeraHabis,
                    onSelected: (value) {
                      stokProdukProv.setStatusSegeraHabis = value;
                    },
                  ),
                  FilterChip(
                    label: Text("Habis"),
                    selected: stokProdukProv.getStatusHabis,
                    onSelected: (value) {
                      stokProdukProv.setStatusHabis = value;
                    },
                  ),
                ],
              ),
              for (var i = 0; i < stokProdukProv.getStokProduk.length; i++)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: Row(
                      children: [
                        Image.asset(
                          stokProdukProv.getStokProduk[i]['img'],
                          width: 125,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                stokProdukProv.getStokProduk[i]['nama'],
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Figtree'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text(
                                    "Restock",
                                    style: TextStyle(color: Colors.teal[500]),
                                  )),
                            ),
                          ],
                        ),
                        if (stokProdukProv.getStokProduk[i].containsKey('sisa'))
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 75,
                              height: 100,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.yellow[500],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Sisa",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "${stokProdukProv.getStokProduk[i]['sisa']}",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
