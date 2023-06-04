import 'package:flutter/material.dart';
import 'package:tim_apel/screens/payment/item_pembayaran.dart';

class ListPayment extends StatelessWidget {
  const ListPayment({super.key});

  @override
  Widget build(BuildContext context) {
    List listMetodePembayaran = [
      {'icon_name': 'tunai', 'appbar_title': 'Tunai', 'logo_name': ""},
      {'icon_name': 'ovo', 'appbar_title': 'OVO', 'logo_name': 'logo_ovo'},
      {
        'icon_name': 'gopay',
        'appbar_title': 'GoPay',
        'logo_name': 'logo_gopay'
      },
      {
        'icon_name': 'shopee-pay',
        'appbar_title': 'ShopeePay',
        'logo_name': 'logo_shopee'
      },
      {'icon_name': 'dana', 'appbar_title': 'DANA', 'logo_name': 'logo_dana'},
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
                      "assets/payment/${listMetodePembayaran[i]['icon_name']}.png",
                      width: 100,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[300]),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ItemPembayaran(
                                        metodePembayaran:
                                            listMetodePembayaran[i]
                                                ['appbar_title'],
                                        iconName: listMetodePembayaran[i]
                                            ['icon_name'],
                                        logoName: listMetodePembayaran[i]
                                            ['logo_name'],
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
