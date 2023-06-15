import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/qtyProduk_provider.dart';
import 'package:tim_apel/models/produk_data_model.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';

import '../utilities/formatting.dart';

class DetailProduk extends StatefulWidget {
  final Produk produk;
  const DetailProduk({super.key, required this.produk});

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  @override
  Widget build(BuildContext context) {
    var transaksiProvider = Provider.of<TransaksiProvider>(context);

    var qtyProvider = Provider.of<QtyProdukProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              qtyProvider.setQty = 1;
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                children: [
                  Image.asset(
                    widget.produk.gambar,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.produk.nama,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "@${widget.produk.hargaJual}",
                          style: TextStyle(color: Colors.teal[500], fontSize: 22),
                        )),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Jumlah"),
                      InputQty(
                        minVal: 1,
                        showMessageLimit: false,
                        initVal: qtyProvider.getQty,
                        borderShape: BorderShapeBtn.none,
                        onQtyChanged: (val) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            qtyProvider.setQty = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Subtotal"),
                      Text(currency(widget.produk.hargaJual * qtyProvider.getQty)),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[500]),
                        onPressed: () {},
                        child: Text(
                            "Add to Cart ${transaksiProvider.selectedAntrean > -1 ? '(Antrean ${transaksiProvider.selectedAntrean})' : ''}")),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
