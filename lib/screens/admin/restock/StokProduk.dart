import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/produk_data_model.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/providers/stok_produk_provider.dart';

class StokProduk extends StatefulWidget {
  const StokProduk({super.key});

  @override
  State<StokProduk> createState() => _StokProdukState();
}

class _StokProdukState extends State<StokProduk> {
  @override
  Widget build(BuildContext context) {
    var stokProdukProv = Provider.of<StokProdukProvider>(context);
    var produkProv = Provider.of<ProdukProvider>(context);
    // var filteredStokProduk = stokProdukProv.getStokProduk;

    List <Produk> stokProduk  =
      !(stokProdukProv.statusSegeraHabis ^ stokProdukProv.statusHabis) ?
      // Return all products if no filter is selected OR if both filters are selected
      produkProv.getProdukHampirHabis().addAll(produkProv.getProdukHabis()) :
      (stokProdukProv.statusSegeraHabis) ? produkProv.getProdukHampirHabis() : 
      (stokProdukProv.statusHabis) ? produkProv.getProdukHabis() : null; 
    
    return Scaffold(
        appBar: AppBar(
          title: const Text("Segera Restock"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilterChip(
                    label: const Text("Segera Habis"),
                    selected: stokProdukProv.statusSegeraHabis,
                    onSelected: (value) {
                      stokProdukProv.setStatusSegeraHabis = value;
                    },
                  ),
                  FilterChip(
                    label: const Text("Habis"),
                    selected: stokProdukProv.statusHabis,
                    onSelected: (value) {
                      stokProdukProv.setStatusHabis = value;
                    },
                  ),
                ],
              ),
              for (var i = 0; i < stokProduk.length; i++)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: Row(
                      children: [
                        Image.asset(
                          stokProduk[i].gambar,
                          width: 125,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                stokProduk[i].nama,
                                style: const TextStyle(fontSize: 16, fontFamily: 'Figtree'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                  child: Text(
                                    "Restock",
                                    style: TextStyle(color: Colors.teal[500]),
                                  )),
                            ),
                          ],
                        ),
                        if (stokProdukProv.statusSegeraHabis)
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 75,
                                height: 100,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.yellow[500],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        "Sisa",
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "${stokProduk[i].stok}",
                                        style: const TextStyle(
                                            fontSize: 35, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
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
