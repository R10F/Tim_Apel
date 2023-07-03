import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/providers/search_laris_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/admin/analisis_penjualan/CustomSearchLaris.dart';
import 'package:tim_apel/screens/admin/analisis_penjualan/LarisWidget.dart';
import 'package:tim_apel/utilities/datetime.dart';

class ProdukTerlaris extends StatelessWidget {
  const ProdukTerlaris({super.key});

  @override
  Widget build(BuildContext context) {
    var transaksiProv = Provider.of<TransaksiProvider>(context);
    var produkProv = Provider.of<ProdukProvider>(context);
    var searchProv = Provider.of<SearchLarisProvider>(context);

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

      for (var id in ids) {
        terjual[id] = 0;
      }

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
        leading: BackButton(
          onPressed: () {
            searchProv.resetController();
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomSearchLaris(),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          //   child: TextField(
          //     decoration: InputDecoration(
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(15)),
          //         labelText: 'Nama Produk',
          //         suffixIcon: const Icon(Icons.search)),
          //   ),
          // ),
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
        ]),
      ),
    );
  }
}
