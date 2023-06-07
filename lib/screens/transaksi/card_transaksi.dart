import 'package:flutter/material.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/screens/transaksi/rincian_transaksi.dart';
import 'package:tim_apel/utilities/formatting.dart';

class CardTransaksi extends StatefulWidget {
  const CardTransaksi(
      {super.key,
      required this.transaksi,
      required this.namaKasir,
      required this.index,
      required this.prov});

  final TransaksiModel transaksi;
  final String namaKasir;
  final int index;
  final prov;

  @override
  State<CardTransaksi> createState() => _CardTransaksiState();
}

class _CardTransaksiState extends State<CardTransaksi> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Antrean ${widget.transaksi.nomorAntrean}'),
                  Text(widget.namaKasir),
                  Text(currency(widget.transaksi.totalBelanja)),
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
                              color: Colors.teal[500]!, // Outline border color
                              width: 2.0, // Outline border width
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4), // Rounded corner radius
                            ),
                          ),
                          child: const Text('Rincian',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 150, 136), // Text color
                              ))),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: OutlinedButton(
                            onPressed: () {
                              widget.prov.deleteOrder(widget.index);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.red, // Outline border color
                                width: 2.0, // Outline border width
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4), // Rounded corner radius
                              ),
                            ),
                            child: const Text('Hapus',
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
