import 'package:flutter/material.dart';
import 'package:tim_apel/screens/admin/account/register_staf.dart';

class RegisterDone extends StatelessWidget {
  const RegisterDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, bottom: 15, left: 50, right: 50),
                child: Image.asset('assets/images/register-done.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  'Berhasil\nMendaftar Staf Baru',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
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
                padding: const EdgeInsets.only(bottom: 75, left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RegisterStaf()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal[700]),
                          child: const Text(
                            'Tambah Staf Lagi',
                            style:
                                TextStyle(fontFamily: 'Figtree', fontSize: 16),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
