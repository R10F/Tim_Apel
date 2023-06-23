import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/qty_produk_provider.dart';
import 'package:tim_apel/models/produk_data_model.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/utilities/formatting.dart';

class DetailProduk extends StatefulWidget {
  const DetailProduk({super.key, required this.idTransaksi, required this.produk});

  final int idTransaksi;
  final Produk produk;

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
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/product_images/${widget.produk.gambar}',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20, right: 25, bottom: 16),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.produk.nama,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 25),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "@ ${currency(widget.produk.hargaJual)}",
                          style: TextStyle(color: Colors.teal[700], fontSize: 20),
                        )),
                  ),
                  widget.produk.deskripsi != ''
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20, right: 25, top: 25),
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                widget.produk.deskripsi,
                                style: const TextStyle(color: Colors.black54, fontSize: 16),
                              )),
                        )
                      : Container(),
                ],
              ),
            ),
            const Divider(indent: 20, endIndent: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25, top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Stok"),
                      Text(widget.produk.stok.toString()),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Jumlah"),
                      InputQty(
                        minVal: 1,
                        maxVal: widget.produk.stok,
                        showMessageLimit: false,
                        initVal: transaksiProvider.hasTransaksiActive
                            ? transaksiProvider.listTransaksi[widget.idTransaksi].listProduk
                                    .containsKey(widget.produk.id)
                                ? transaksiProvider
                                    .listTransaksi[widget.idTransaksi].listProduk[widget.produk.id]
                                : 1
                            : 1,
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25),
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
                    padding: const EdgeInsets.only(top: 40, bottom: 50),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal[500],
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                            onPressed: transaksiProvider.hasTransaksiActive
                                ? () {
                                    transaksiProvider.addToCart(
                                        widget.idTransaksi, widget.produk.id, qtyProvider.getQty);
                                  }
                                : null,
                            child: transaksiProvider.hasTransaksiActive
                                ? Text(
                                    "${transaksiProvider.listTransaksi[widget.idTransaksi].listProduk.containsKey(widget.produk.id) ? 'Update Cart' : 'Add to Cart'} (Antrean ${transaksiProvider.listTransaksi[widget.idTransaksi].nomorAntrean})")
                                : const Text('Add to Cart')),
                        transaksiProvider.selectedAntrean == -1
                            ? const Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Text('Tidak ada transaksi yang sedang aktif/dipilih.',
                                    style: TextStyle(color: Colors.red)),
                              )
                            : Container()
                      ],
                    ),
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
