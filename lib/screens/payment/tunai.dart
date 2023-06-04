import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tunai extends StatefulWidget {
  const Tunai({super.key});

  @override
  State<Tunai> createState() => _TunaiState();
}

class _TunaiState extends State<Tunai> {
  List<bool?> _choiceChipsStatus = [false, false, false, false, false];

  List _choiceChipsText = [
    'Uang Pas',
    NumberFormat.currency(locale: 'ID', symbol: 'Rp').format(5000),
    NumberFormat.currency(locale: 'ID', symbol: 'Rp').format(10000),
    NumberFormat.currency(locale: 'ID', symbol: 'Rp').format(20000),
    NumberFormat.currency(locale: 'ID', symbol: 'Rp').format(50000),
    NumberFormat.currency(locale: 'ID', symbol: 'Rp').format(100000),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Jumlah Uang',
            hintText: '',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(),
          ),
        ),
        Text(
          'Kembalian',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                _choiceChipsStatus.length,
                (index) => ChoiceChip(
                    onSelected: (value) {
                      setState(() {
                        _choiceChipsStatus.fillRange(
                            0, _choiceChipsStatus.length, false);
                        _choiceChipsStatus[index] = true;
                      });
                    },
                    label: Text(_choiceChipsText[index]),
                    selectedColor: Colors.teal[100],
                    selected: _choiceChipsStatus[index]!)),
          ),
        )
      ],
    );
  }
}
