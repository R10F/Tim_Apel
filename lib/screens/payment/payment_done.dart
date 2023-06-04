import 'package:flutter/material.dart';

class PaymentDone extends StatelessWidget {
  const PaymentDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/payment/payment-done.png'),
                const Text(
                  'Transaksi Berhasil!',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Yeay! Order XXX telah selesai diproses.',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Figtree',
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal[700]),
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
                          child: const Text('Kembali ke Beranda')),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
