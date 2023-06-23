import 'package:flutter/material.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/screens/payment/item_metode_pembayaran.dart';

class PaymentList extends StatelessWidget {
  const PaymentList(
      {super.key, required this.idTransaksi, required this.totalHarga, required this.nomorAntrean});

  final int idTransaksi;
  final int totalHarga;
  final int nomorAntrean;

  @override
  Widget build(BuildContext context) {
    List<String> listMetodePembayaran = TransaksiData().listMetodePembayaran;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text('Pilih Salah Satu Metode Pembayaran',
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            ),
            for (int i = 0; i < listMetodePembayaran.length; i++)
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 20),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/payment/${listMetodePembayaran[i].toLowerCase()}-logo_text.png",
                      width: 100,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ItemMetodePembayaran(
                                        idTransaksi: idTransaksi,
                                        totalHarga: totalHarga,
                                        metodePembayaran: listMetodePembayaran[i],
                                        iconName: listMetodePembayaran[i].toLowerCase(),
                                        nomorAntrean: nomorAntrean,
                                      )));
                        },
                        child: const Text('Pilih'))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
