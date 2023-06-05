import 'package:flutter/material.dart';
import 'package:tim_apel/screens/payment/item_metode_pembayaran.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({super.key});

  @override
  Widget build(BuildContext context) {
    List listMetodePembayaran = [
      {'icon_name': 'tunai', 'appbar_title': 'Tunai'},
      {'icon_name': 'ovo', 'appbar_title': 'OVO'},
      {'icon_name': 'gopay', 'appbar_title': 'GoPay'},
      {'icon_name': 'shopeepay', 'appbar_title': 'ShopeePay'},
      {'icon_name': 'dana', 'appbar_title': 'DANA'},
    ];

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
                      "assets/payment/${listMetodePembayaran[i]['icon_name']}-logo_text.png",
                      width: 100,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ItemMetodePembayaran(
                                        metodePembayaran: listMetodePembayaran[i]['appbar_title'],
                                        iconName: listMetodePembayaran[i]['icon_name'],
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
