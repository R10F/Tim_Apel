import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/admin/analisis_penjualan/LarisWidget.dart';
import 'package:tim_apel/utilities/datetime.dart';

class ProdukTerlaris extends StatelessWidget {
  const ProdukTerlaris({super.key});

  @override
  Widget build(BuildContext context) {
    var transaksiProv = Provider.of<TransaksiProvider>(context);
    var produkProv = Provider.of<ProdukProvider>(context);

    List<List<int>> getProdukLaris(String kategori) {
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
      Map<int, int> terjual = {};

      for (Map<int, int> listProduk in transaksi) {
        listProduk.forEach((id, qty) {
          if (ids.contains(id)) {
            terjual.update(
              id,
              (value) => terjual[id]! - qty,
              ifAbsent: () => -qty,
            ); //- karena sortingnya kecil ke besar
          }
        });
      }

      var temp = terjual.entries.toList()
        ..sort((a, b) => a.value.compareTo(b.value));
      terjual = Map<int, int>.fromEntries(temp);
      List<int> slicedKey = List<int>.from(terjual.keys.toList().take(3));
      List<int> slicedQty = List<int>.from(terjual.values.toList().take(3));

      return [slicedKey, slicedQty];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Produk Terlaris"),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          for (int i = 0; i < produkProv.kategori.length; i++)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "${produkProv.kategori[i]}",
                    style: const TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
                LarisBuilder(idAndQty: getProdukLaris(produkProv.kategori[i])),
              ],
            ),
        ]
            // [
            //   Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            //     child: TextField(
            //       decoration: InputDecoration(
            //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            //           labelText: 'Nama Produk',
            //           suffixIcon: const Icon(Icons.search)),
            //     ),
            //   ),
            //   const Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 25),
            //     child: Text(
            //       "ATK",
            //       style: TextStyle(
            //         fontSize: 23,
            //       ),
            //     ),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Card(
            //       child: Row(
            //         children: [
            //           SizedBox(
            //             width: 75,
            //             height: 75,
            //             child: DecoratedBox(
            //               decoration: BoxDecoration(
            //                   color: Colors.green[500], borderRadius: BorderRadius.circular(5)),
            //               child: Center(
            //                 child: Text(
            //                   "1",
            //                   style: TextStyle(
            //                     fontSize: 30,
            //                     fontWeight: FontWeight.bold,
            //                     color: accountProvider.getSetting('dark_mode')
            //                         ? Colors.black
            //                         : Colors.white,
            //                   ),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               const Padding(
            //                 padding: EdgeInsets.all(8.0),
            //                 child: Text(
            //                   "Lem Lilin Uk. Kecil",
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(horizontal: 8),
            //                 child: Text(
            //                   "terjual: 100/bulan",
            //                   style: TextStyle(fontSize: 15, color: Colors.green[500]),
            //                 ),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   )
            // ],
            ),
      ),
    );
  }
}
