import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/providers/search_laris_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/admin/analisis_penjualan/custom_search.dart';
import 'package:tim_apel/screens/admin/analisis_penjualan/produk_tidak_laris/tidak_laris_builder.dart';
import 'package:tim_apel/utilities/datetime.dart';

class ProdukTidakLaris extends StatefulWidget {
  const ProdukTidakLaris({super.key});

  @override
  State<ProdukTidakLaris> createState() => _ProdukTidakLarisState();
}

class _ProdukTidakLarisState extends State<ProdukTidakLaris> {
  @override
  Widget build(BuildContext context) {
    var transaksiProv = Provider.of<TransaksiProvider>(context);
    var produkProv = Provider.of<ProdukProvider>(context);
    var searchProv = Provider.of<SearchLarisProvider>(context);

    List<List<int>> getProdukTidakLaris(String kategori) {
      List ids = produkProv.semuaProduk
          .where((produk) => produk.kategori == kategori)
          .toList()
          .map((e) => e.id)
          .toList();

      List<Transaksi> last30day = transaksiProv.listTransaksi
          .where((transaksi) =>
              transaksi.inProcess == false &&
              DateTime.now().difference(parseDate(transaksi.date)).inDays <= 30)
          .toList();

      List<Map<int, int>> transaksi = last30day
          .map(
            (e) => e.listProduk,
          )
          .toList();
      Map<int, List<int>> terjual = {};

      for (var id in ids) {
        terjual[id] = [0, 0];
      }

      for (Map<int, int> listProduk in transaksi) {
        listProduk.forEach((id, qty) {
          if (ids.contains(id)) {
            terjual.update(
              id,
              (value) => [terjual[id]![0] + qty, terjual[id]![1]],
            );
          }
        });
      }

      List allTimeTransaksi = transaksiProv.listTransaksi
          .where((transaksi) => transaksi.inProcess == false)
          .toList()
          .map(
            (e) => e.listProduk,
          )
          .toList();

      for (Map<int, int> listProduk in allTimeTransaksi) {
        listProduk.forEach((id, qty) {
          if (ids.contains(id)) {
            terjual.update(
              id,
              (value) => [terjual[id]![0], terjual[id]![1] + qty],
            );
          }
        });
      }

      var temp = terjual.entries.toList()
        ..sort((a, b) {
          int cmp = a.value[0].compareTo(b.value[0]);
          if (cmp != 0) return cmp;
          return a.value[1].compareTo(b.value[1]);
        });

      terjual = Map<int, List<int>>.fromEntries(temp);
      List<int> slicedKey = List<int>.from(terjual.keys.toList().take(3));
      List<List<int>> allQty = List<List<int>>.from(terjual.values.toList().take(3));
      List<int> slicedQty = allQty.map((e) => e[0]).toList();
      List<int> slicedAllQty = allQty.map((e) => e[1]).toList();

      return [slicedKey, slicedQty, slicedAllQty];
    }

    List listProdukTidakLaris = [];
    for (int i = 0; i < produkProv.kategori.length; i++) {
      var produkTidakLaris = getProdukTidakLaris(produkProv.kategori[i]);
      int produkCount = 0;

      for (int i = 0; i < produkTidakLaris[0].length; i++) {
        if (produkProv
            .getProdukById(produkTidakLaris[0][i])
            .nama
            .toString()
            .toLowerCase()
            .contains(searchProv.query.toLowerCase())) {
          produkCount++;
        }
      }

      listProdukTidakLaris.add({
        'kategori': produkProv.kategori[i],
        'produk_count': produkCount,
        'list_produk': produkTidakLaris,
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Produk Tidak Laris"),
        leading: BackButton(
          onPressed: () {
            searchProv.resetController();
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 80),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CustomSearchLaris(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            //   child: TextField(
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            //         labelText: 'Nama Produk',
            //         suffixIcon: const Icon(Icons.search)),
            //   ),
            // ),
            for (int i = 0; i < listProdukTidakLaris.length; i++)
              if (listProdukTidakLaris[i]['produk_count'] > 0)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 10),
                      child: Text(
                        "${listProdukTidakLaris[i]['kategori']}",
                        style: const TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ),
                    TidakLarisBuilder(idAndQty: listProdukTidakLaris[i]['list_produk']),
                  ],
                ),
          ])
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Card(
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           width: 75,
          //           height: 75,
          //           child: DecoratedBox(
          //             decoration: BoxDecoration(
          //                 color: Colors.red[800], borderRadius: BorderRadius.circular(5)),
          //             child: Center(
          //               child: Text(
          //                 "1",
          //                 style: TextStyle(
          //                   fontSize: 30,
          //                   fontWeight: FontWeight.bold,
          //                   color: accountProvider.getSetting('dark_mode')
          //                       ? Colors.black
          //                       : Colors.white,
          //                 ),
          //                 textAlign: TextAlign.center,
          //               ),
          //             ),
          //           ),
          //         ),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             const Padding(
          //               padding: EdgeInsets.all(8.0),
          //               child: Text(
          //                 "Lem Lilin Uk. Kecil",
          //                 style: TextStyle(fontSize: 16),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 8),
          //               child: Text(
          //                 "terjual: 0/bulan",
          //                 style: TextStyle(fontSize: 15, color: Colors.red[600]),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 8),
          //               child: Text(
          //                 "total terjual : 10",
          //                 style: TextStyle(fontSize: 14, color: Colors.red[600]),
          //               ),
          //             ),
          //           ],
          //         )
          //       ],
          //     ),
          //     ),
          //   )
          // ],
          // ),
          ),
    );
  }
}
