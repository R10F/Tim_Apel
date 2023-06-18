// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/transaksi/dalam_proses/rincian_transaksi.dart';
import 'package:tim_apel/utilities/formatting.dart';

class CardTransaksiDalamProses extends StatefulWidget {
  const CardTransaksiDalamProses(
      {super.key,
      required this.transaksi,
      required this.namaKasir,
      required this.index,
      required this.prov});

  final Transaksi transaksi;
  final String namaKasir;
  final int index;
  final prov;

  @override
  State<CardTransaksiDalamProses> createState() => _CardTransaksiDalamProsesState();
}

class _CardTransaksiDalamProsesState extends State<CardTransaksiDalamProses> {
  @override
  Widget build(BuildContext context) {
    var transaksiProvider = Provider.of<TransaksiProvider>(context);
    bool isActive = widget.index == transaksiProvider.selectedAntrean;

    return GestureDetector(
      onTap: () {
        transaksiProvider.selectedAntrean = widget.index;
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    border: isActive
                        ? Border.all(color: Colours.lightSalmon, width: 2)
                        : Border.all(color: Colors.teal[200]!),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text('Antrean ${widget.transaksi.nomorAntrean}',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                        Text(widget.namaKasir, style: TextStyle(color: Colors.teal[500])),
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text('${widget.transaksi.itemCount} item',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.teal[500])),
                        ),
                        Text(currency(widget.transaksi.totalHargaBelanja),
                            style: TextStyle(color: Colors.teal[500])),
                      ]),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.translate(
                          offset: const Offset(-8, 2),
                          child: Row(children: [
                            Radio(
                              value: widget.index,
                              groupValue: transaksiProvider.selectedAntrean,
                              onChanged: (value) {
                                transaksiProvider.selectedAntrean = value;
                              },
                            ),
                            isActive
                                ? const Text('Sedang aktif',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                                : Container(),
                          ])),
                      Row(children: [
                        OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RincianTransaksi(
                                            idTransaksi: widget.index,
                                            namaKasir: widget.namaKasir,
                                            transaksi: widget.transaksi,
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
                            child: const Text('Rincian',
                                style: TextStyle(
                                  color: Color(0xFF00796B),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: OutlinedButton(
                              onPressed: () {
                                widget.prov.deleteOrder(widget.index);
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Color.fromARGB(150, 244, 67, 54),
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: const Text('Batal',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ))),
                        ),
                      ])
                    ],
                  )
                ])),
          ),
        ],
      ),
    );
  }
}
