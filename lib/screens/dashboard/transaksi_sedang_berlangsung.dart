// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/bottom_navbar_provider.dart';
import 'package:tim_apel/screens/transaksi/dalam_proses/rincian_transaksi.dart';

class TransaksiSedangBerlangsung extends StatefulWidget {
  const TransaksiSedangBerlangsung(
      {super.key, required this.accountProvider, required this.listTransaksi});

  final accountProvider;
  final List listTransaksi;

  @override
  State<TransaksiSedangBerlangsung> createState() => _TransaksiSedangBerlangsungState();
}

class _TransaksiSedangBerlangsungState extends State<TransaksiSedangBerlangsung> {
  @override
  Widget build(BuildContext context) {
    var bottomnavProvider = Provider.of<BottomNavbarProvider>(context);

    int indexCount = 0;
    int listItemCount = 0;
    for (int i = 0; i < widget.listTransaksi.length; i++) {
      if (widget.listTransaksi[i].inProcess) {
        listItemCount++;
      }
    }

    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 25, top: 30, bottom: 20),
        child: Container(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Sedang Berlangsung",
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: () {
                  bottomnavProvider.setSelectedIdx = 2; // Goto: Halaman transaksi
                },
                child: Row(
                  children: [
                    const Text(
                      "Lihat transaksi",
                      style: TextStyle(
                          height: 2,
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w500),
                    ),
                    Transform.translate(
                        offset: const Offset(-2, 4),
                        child: const Icon(Icons.arrow_right_alt_outlined, color: Colors.grey))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Container(
          padding: const EdgeInsets.only(top: 20, bottom: 24, left: 4, right: 4),
          margin: const EdgeInsets.only(left: 20, right: 25, bottom: 30),
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
          child: listItemCount > 0
              ? Column(children: [
                  for (int index = 0; index < widget.listTransaksi.length; index++)
                    if (widget.listTransaksi[index].inProcess)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RincianTransaksi(
                                        idTransaksi: index,
                                        namaKasir: widget.accountProvider
                                            .userAccounts[widget.listTransaksi[index].idKasir].nama,
                                        transaksi: widget.listTransaksi[index],
                                      )));
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4, left: 15, right: 15),
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Antrean ${widget.listTransaksi[index].nomorAntrean}',
                                                style: const TextStyle(
                                                    fontFamily: 'Figtree', fontSize: 18),
                                              ),
                                              Text(
                                                widget
                                                    .accountProvider
                                                    .userAccounts[
                                                        widget.listTransaksi[index].idKasir]
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
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => RincianTransaksi(
                                                      idTransaksi: index,
                                                      namaKasir: widget
                                                          .accountProvider
                                                          .userAccounts[
                                                              widget.listTransaksi[index].idKasir]
                                                          .nama,
                                                      transaksi: widget.listTransaksi[index],
                                                    )));
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
                                            color: widget.accountProvider.getSetting('dark_mode')
                                                ? Colors.white
                                                : const Color(0xFF00796B),
                                          ))),
                                )
                              ],
                            ),
                            indexCount++ < listItemCount - 1
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Divider(indent: 15, endIndent: 15, thickness: 2),
                                  )
                                : Container()
                          ],
                        ),
                      )
                ])
              : Padding(
                  padding: const EdgeInsets.only(top: 4, left: 15, right: 15),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Tidak ada pesanan yang sedang berlangsung",
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
