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

    List<Produk> stokProduk = [];

    if (!(stokProdukProv.statusSegeraHabis ^ stokProdukProv.statusHabis)) {
      // Return all products if no filter is selected OR if both filters are selected
      stokProduk = produkProv.getProdukHampirHabis();
      stokProduk.addAll(produkProv.getProdukHabis());
    } else if (stokProdukProv.statusSegeraHabis) {
      stokProduk = produkProv.getProdukHampirHabis();
    } else {
      stokProduk = produkProv.getProdukHabis();
    }

    return Scaffold(
        appBar: AppBar(
            title: const Text("Segera Restock"),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kTextTabBarHeight),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: FilterChip(
                      label: const Text("Segera Habis"),
                      selected: stokProdukProv.statusSegeraHabis,
                      onSelected: (value) {
                        stokProdukProv.setStatusSegeraHabis = value;
                      },
                    ),
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
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // FilterChip(
                    //   label: const Text("Segera Habis"),
                    //   selected: stokProdukProv.statusSegeraHabis,
                    //   onSelected: (value) {
                    //     stokProdukProv.setStatusSegeraHabis = value;
                    //   },
                    // ),
                    // FilterChip(
                    //   label: const Text("Habis"),
                    //   selected: stokProdukProv.statusHabis,
                    //   onSelected: (value) {
                    //     stokProdukProv.setStatusHabis = value;
                    //   },
                    // ),
                  ],
                ),
                for (var i = 0; i < stokProduk.length; i++)
                  Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image.asset(
                            "assets/product_images/${stokProduk[i].gambar}",
                            width: 125,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 16),
                                child: Text(
                                  stokProduk[i].nama,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Figtree'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                    child: Text(
                                      "Restock",
                                      style: TextStyle(
                                        color: Colors.teal[500],
                                        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 75,
                            height: 100,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: stokProduk[i].stok == 0 ? Colors.red : Colors.yellow[500],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Sisa",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "${stokProduk[i].stok}",
                                    style: const TextStyle(
                                        color: Colors.black,
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
              ],
            ),
          ),
        ));
  }
}
