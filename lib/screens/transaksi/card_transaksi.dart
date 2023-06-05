import 'package:flutter/material.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';

class CardTransaksi extends StatefulWidget {
  const CardTransaksi({super.key, required this.transaksi});

  final TransaksiModel transaksi;

  @override
  State<CardTransaksi> createState() => _CardTransaksiState();
}

class _CardTransaksiState extends State<CardTransaksi> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.transaksi.nomorAntrean);
      },
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
                  Text('Total belanja: ${widget.transaksi.totalBelanja}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => ItemMetodePembayaran(
                            //               metodePembayaran: listMetodePembayaran[i],
                            //               iconName: listMetodePembayaran[i].toLowerCase(),
                            //             )));
                          },
                          child: const Text('Pilih'))
                    ],
                  )
                ])),
          ),
        ],
      ),
    );
  }
}
