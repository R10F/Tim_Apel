import 'package:flutter/material.dart';
import 'package:tim_apel/screen/DaftarStaf.dart';

class RegistDone extends StatelessWidget {
  const RegistDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 25),
              child: Image.asset('assets/images/registDone.png'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Berhasil \nMendaftar Staf Baru',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Text(
                          'Kembali Ke Beranda',
                          style: TextStyle(
                              color: Colors.teal[500],
                              fontFamily: 'Figtree',
                              fontSize: 16),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => const DaftarStaf()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[700]),
                        child: const Text(
                          'Tambah Staf Lagi',
                          style: TextStyle(fontFamily: 'Figtree', fontSize: 16),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
