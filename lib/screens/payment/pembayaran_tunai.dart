import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PembayaranTunai extends StatefulWidget {
  const PembayaranTunai({super.key});

  @override
  State<PembayaranTunai> createState() => _PembayaranTunaiState();
}

class _PembayaranTunaiState extends State<PembayaranTunai> {
  final currency = NumberFormat.currency(locale: 'ID', symbol: 'Rp');
  final List<bool?> _choiceChipsStatus = [
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final List<int> _choiceChipsValue = [
    0,
    5000,
    10000,
    20000,
    50000,
    100000
  ]; //20500 diganti dengan harga asli
  final List _choiceChipsText = [
    'Uang Pas',
    NumberFormat.currency(locale: 'ID', symbol: 'Rp').format(5000),
    NumberFormat.currency(locale: 'ID', symbol: 'Rp').format(10000),
    NumberFormat.currency(locale: 'ID', symbol: 'Rp').format(20000),
    NumberFormat.currency(locale: 'ID', symbol: 'Rp').format(50000),
    NumberFormat.currency(locale: 'ID', symbol: 'Rp').format(100000),
  ];
  TextEditingController kembalianController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Jumlah Uang',
            hintText: '',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                _choiceChipsStatus.length,
                (index) => Container(
                      child: ChoiceChip(
                          onSelected: (value) {
                            setState(() {
                              _choiceChipsStatus.fillRange(
                                  0, _choiceChipsStatus.length, false);
                              _choiceChipsStatus[index] = true;
                              (index == 0)
                                  ? kembalianController.text = "0"
                                  : kembalianController.text = currency
                                      .format(_choiceChipsValue[index] - 20500);
                              // !! 20500 diganti dgn harga asli !!
                            });
                          },
                          label: Text(_choiceChipsText[index]),
                          selectedColor: Colors.teal[100],
                          selected: _choiceChipsStatus[index]!),
                    )),
          ),
        ),
        const Text(
          'Kembalian',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        TextField(
          enabled: false,
          controller: kembalianController,
        ),
      ],
    );
  }
}
