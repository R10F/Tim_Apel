// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:tim_apel/utilities/formatting.dart';

class PembayaranTunai extends StatefulWidget {
  const PembayaranTunai({super.key, required this.totalHarga, required this.konfirmasiPembayaran});

  final int totalHarga;
  final konfirmasiPembayaran;

  @override
  State<PembayaranTunai> createState() => _PembayaranTunaiState();
}

class _PembayaranTunaiState extends State<PembayaranTunai> {
  final List<int> _chipValue = [-1, 5000, 10000, 20000, 50000, 100000];
  final List<bool> _chipStatus = [false, false, false, false, false, false];

  late int _totalHarga;
  int _jumlahUang = 0;
  int _kembalian = -1;

  @override
  void initState() {
    super.initState();
    _totalHarga = widget.totalHarga;
    _chipValue[0] = widget.totalHarga;
    jumlahUangController.text = _jumlahUang.toString();
  }

  void setKembalian() {
    if (_jumlahUang < _totalHarga) {
      _kembalian = -1;
    } else {
      _kembalian = _jumlahUang - _totalHarga;
    }
    kembalianController.text = _kembalian == -1 ? '-' : currency(_kembalian);
  }

  TextEditingController jumlahUangController = TextEditingController();
  TextEditingController kembalianController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 20),
          child: TextField(
            controller: jumlahUangController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _jumlahUang = int.parse(value);
                setKembalian();
              });
            },
            decoration: const InputDecoration(
              labelText: 'Jumlah Uang',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
                _chipValue.length,
                (index) => InputChip(
                    selected: _chipStatus[index],
                    selectedColor: Colours.lightSalmon,
                    showCheckmark: false,
                    label: Text(index == 0 ? 'Uang Pas' : currency(_chipValue[index])),
                    onPressed: () {
                      setState(() {
                        _chipStatus[index] = !_chipStatus[index];

                        if (_chipStatus[index]) {
                          _jumlahUang += _chipValue[index];
                        } else {
                          _jumlahUang -= _chipValue[index];
                        }
                        jumlahUangController.text = _jumlahUang.toString();

                        setKembalian();
                      });
                    }))),
        _kembalian > -1
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 8),
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
                  controller: kembalianController,
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
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
                            onPressed: () {
                              widget.konfirmasiPembayaran();
                            },
                            child: const Text(
                              'Konfirmasi Pembayaran',
                              style: TextStyle(fontFamily: 'Figtree', fontSize: 16),
                            )),
                      ),
                    ],
                  ),
                )
              ])
            : Container()
      ],
    );
  }
}
