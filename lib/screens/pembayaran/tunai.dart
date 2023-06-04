import 'package:flutter/material.dart';

class Tunai extends StatelessWidget {
  const Tunai({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
        TextField(
          enabled: false,
          decoration: InputDecoration(
            hintText: 'Enter your username',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
