// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/screens/transaksi/selesai/rincian_transaksi.dart';
import 'package:tim_apel/utilities/formatting.dart';

class CardTransaksiSelesai extends StatefulWidget {
  const CardTransaksiSelesai(
      {super.key,
      required this.transaksi,
      required this.namaKasir,
      required this.index,
      required this.accountProvider,
      required this.prov});

  final Transaksi transaksi;
  final String namaKasir;
  final int index;
  final accountProvider;
  final prov;

  @override
  State<CardTransaksiSelesai> createState() => _CardTransaksiSelesaiState();
}

class _CardTransaksiSelesaiState extends State<CardTransaksiSelesai> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => RincianTransaksi(
                    index: widget.index,
                    namaKasir: widget.namaKasir,
                    transaksi: widget.transaksi,
                    totalBelanja: widget.transaksi.totalHargaBelanjaAkhir())));
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal[200]!),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text('Antrean ${widget.transaksi.nomorAntrean}',
                            style: const TextStyle(fontSize: 18)),
                      ),
                      Text(widget.namaKasir, style: TextStyle(color: Colors.teal[500])),
                    ]),
                  ),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(currency(widget.transaksi.totalHargaBelanjaAkhir()),
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      Text(widget.transaksi.metodePembayaran,
                          style: TextStyle(color: Colors.teal[500])),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RincianTransaksi(
                                      index: widget.index,
                                      namaKasir: widget.namaKasir,
                                      transaksi: widget.transaksi,
                                      totalBelanja: widget.transaksi.totalHargaBelanjaAkhir())));
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
                              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                              color: widget.accountProvider.getSetting('dark_mode')
                                  ? Colors.white
                                  : const Color(0xFF00796B),
                            ))),
                  )
                ])),
          ),
        ],
      ),
    );
  }
}
