// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tim_apel/screens/transaksi/selesai/rincian_transaksi.dart';
import 'package:tim_apel/utilities/formatting.dart';

class TransaksiBaruDiselesaikan extends StatefulWidget {
  const TransaksiBaruDiselesaikan(
      {super.key, required this.accountProvider, required this.listTransaksi});

  final accountProvider;
  final List listTransaksi;

  @override
  State<TransaksiBaruDiselesaikan> createState() => _TransaksiBaruDiselesaikanState();
}

class _TransaksiBaruDiselesaikanState extends State<TransaksiBaruDiselesaikan> {
  @override
  Widget build(BuildContext context) {
    List listTransaksi = widget.listTransaksi
        .sublist(0, widget.listTransaksi.length > 3 ? 3 : widget.listTransaksi.length);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          alignment: Alignment.topLeft,
          child: const Text(
            "Baru Diselesaikan",
            style: TextStyle(
                fontSize: 20, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Container(
          padding: const EdgeInsets.only(top: 20, bottom: 24, left: 4, right: 4),
          margin: const EdgeInsets.only(left: 20, right: 25, bottom: 60),
          decoration: BoxDecoration(
            color: widget.accountProvider.getSetting('dark_mode') ? Colors.black54 : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: listTransaksi.isNotEmpty
              ? Column(
                  children: List.generate(
                      listTransaksi.length,
                      (index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RincianTransaksi(
                                          index: index,
                                          namaKasir: widget.accountProvider
                                              .userAccounts[listTransaksi[index].idKasir].nama,
                                          transaksi: listTransaksi[index],
                                          totalBelanja:
                                              listTransaksi[index].totalHargaBelanjaAkhir())));
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4, left: 15, right: 15),
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Antrean ${listTransaksi[index].nomorAntrean}',
                                                      style: const TextStyle(
                                                          fontFamily: 'Figtree', fontSize: 18),
                                                    ),
                                                    Text(
                                                      widget
                                                          .accountProvider
                                                          .userAccounts[
                                                              listTransaksi[index].idKasir]
                                                          .nama,
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.grey,
                                                          fontFamily: 'Figtree',
                                                          fontSize: 16),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                          currency(listTransaksi[index].totalHargaBelanjaAkhir()),
                                          style:
                                              const TextStyle(fontFamily: 'Figtree', fontSize: 16)),
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => RincianTransaksi(
                                                        index: index,
                                                        namaKasir: widget
                                                            .accountProvider
                                                            .userAccounts[
                                                                listTransaksi[index].idKasir]
                                                            .nama,
                                                        transaksi: listTransaksi[index],
                                                        totalBelanja: listTransaksi[index]
                                                            .totalHargaBelanjaAkhir())));
                                          },
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Colors.teal[300]!,
                                              width: 2,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                          ),
                                          child: Text('Rincian',
                                              style: TextStyle(
                                                fontSize:
                                                    Theme.of(context).textTheme.bodySmall?.fontSize,
                                                color:
                                                    widget.accountProvider.getSetting('dark_mode')
                                                        ? Colors.white
                                                        : const Color(0xFF00796B),
                                              ))),
                                    )
                                  ],
                                ),
                                index < listTransaksi.length - 1
                                    ? const Padding(
                                        padding: EdgeInsets.only(top: 4),
                                        child: Divider(indent: 15, endIndent: 15, thickness: 2),
                                      )
                                    : Container()
                              ],
                            ),
                          )))
              : Padding(
                  padding: const EdgeInsets.only(top: 4, left: 15, right: 15),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Tidak ada transaksi yang baru diselesaikan",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontFamily: 'Figtree',
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))
    ]);
  }
}
