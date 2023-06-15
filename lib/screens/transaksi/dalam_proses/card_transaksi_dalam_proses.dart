// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
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
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
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
                padding: const EdgeInsets.all(12),
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
                          child: Text('${widget.transaksi.nomorAntrean} item',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.teal[500])),
                        ),
                        Text(currency(widget.transaksi.totalBelanja),
                            style: TextStyle(color: Colors.teal[500])),
                      ]),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RincianTransaksi(
                                          namaKasir: widget.namaKasir,
                                          transaksi: widget.transaksi,
                                        )));
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.teal[300]!, // Outline border color
                              width: 2.0, // Outline border width
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4), // Rounded corner radius
                            ),
                          ),
                          child: const Text('Rincian',
                              style: TextStyle(
                                color: Color(0xFF00796B), // Text color
                              ))),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: OutlinedButton(
                            onPressed: () {
                              widget.prov.deleteOrder(widget.index);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color.fromARGB(150, 244, 67, 54), // Outline border color
                                width: 2.0, // Outline border width
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4), // Rounded corner radius
                              ),
                            ),
                            child: const Text('Batal',
                                style: TextStyle(
                                  color: Colors.red, // Text color
                                ))),
                      ),
                    ],
                  )
                ])),
          ),
        ],
      ),
    );
  }
}
