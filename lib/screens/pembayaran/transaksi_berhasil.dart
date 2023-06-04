import 'package:flutter/material.dart';
import 'package:tim_apel/screens/dashboard/home.dart';

class TransaksiBerhasil extends StatelessWidget {
  const TransaksiBerhasil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              Image.asset('assets/pembayaran/transaksi-selesai.png'),
              const Text(
                'Transaksi Berhasil!',
                textAlign: TextAlign.center,
              ),
              const Text(
                'Yeay! Order XXX telah selesai diproses.',
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: const Text('Kembali ke Beranda')),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
