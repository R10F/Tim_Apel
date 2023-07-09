// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:colours/colours.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/tunai_provider.dart';
import 'package:tim_apel/utilities/formatting.dart';

class PembayaranTunai extends StatefulWidget {
  const PembayaranTunai(
      {super.key,
      required this.totalHarga,
      required this.konfirmasiPembayaran});

  final int totalHarga;
  final konfirmasiPembayaran;

  @override
  State<PembayaranTunai> createState() => _PembayaranTunaiState();
}

class _PembayaranTunaiState extends State<PembayaranTunai> {
  // final List<int> _chipValue = [-1, 5000, 10000, 20000, 50000, 100000];
  // final List<bool> _chipStatus = [false, false, false, false, false, false];

  // late int _totalHarga;
  // int _jumlahUang = 0;
  // int _kembalian = -1;

  // @override
  // void initState() {
  //   super.initState();
  //   _totalHarga = widget.totalHarga;
  //   _jumlahUang = 0;
  //   // _chipValue[0] = widget.totalHarga;
  //   jumlahUangController.text = "";
  // }

  // void setKembalian() {
  //   if (_jumlahUang < _totalHarga) {
  //     _kembalian = -1;
  //   } else {
  //     _kembalian = _jumlahUang - _totalHarga;
  //   }
  //   kembalianController.text = _kembalian == -1 ? '-' : currency(_kembalian);
  // }

  @override
  Widget build(BuildContext context) {
    var tunaiProv = Provider.of<TunaiProvider>(context);
    tunaiProv.setTotalHarga = widget.totalHarga;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 10),
            child: TextField(
              controller: tunaiProv.jumlahUangController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                CurrencyTextInputFormatter(
                    locale: "id", symbol: "Rp", decimalDigits: 0)
              ],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  tunaiProv.setTotalHarga = widget.totalHarga;
                  final numericValue =
                      int.tryParse(value.replaceAll(RegExp(r'[^0-9]'), ''));
                  tunaiProv.setJumlahUang = numericValue ?? 0;
                } else {
                  tunaiProv.setJumlahUang = 0;
                  tunaiProv.setKembalianHarga = -1; //-1 = invalid
                  tunaiProv.kembalianController.clear();
                }
                tunaiProv.setKembalian();
              },
              decoration: InputDecoration(
                labelText: 'Jumlah Uang',
                enabled: tunaiProv.getChipStatus ? false : true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          InputChip(
            label: const Text('Uang Pas'),
            selected: tunaiProv.getChipStatus,
            selectedColor: Colours.lightSalmon,
            onPressed: () {
              tunaiProv.setChipStatus = !tunaiProv.getChipStatus;
              tunaiProv.setJumlahUang = widget.totalHarga;

              if (tunaiProv.getChipStatus) {
                tunaiProv.setTotalHarga = widget.totalHarga;
                tunaiProv.jumlahUangController.text =
                    currency(widget.totalHarga).toString();
                tunaiProv.setJumlahUang = widget.totalHarga;
                tunaiProv.setKembalian();
              } else {
                tunaiProv.jumlahUangController.clear();
                tunaiProv.kembalianController.clear();
                tunaiProv.setKembalianHarga = -1; //-1 = invalid
              }
            },
          ),
          tunaiProv.getChipStatus || tunaiProv.getKembalian >= 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 8),
                      child: Text(
                        'Kembalian',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    TextField(
                      enabled: false,
                      controller: tunaiProv.kembalianController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal[700]),
                                onPressed: () {
                                  tunaiProv.jumlahUangController.clear();
                                  tunaiProv.kembalianController.clear();
                                  tunaiProv.setKembalianHarga = 0;
                                  FocusScope.of(context).unfocus();
                                  widget.konfirmasiPembayaran();
                                },
                                child: Text(
                                  'Konfirmasi Pembayaran',
                                  style: TextStyle(
                                    fontFamily: 'Figtree',
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontSize,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
