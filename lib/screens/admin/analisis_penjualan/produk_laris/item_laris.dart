import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/models/produk_data_model.dart';
import 'package:tim_apel/providers/account_provider.dart';

class ItemLaris extends StatefulWidget {
  const ItemLaris(
      {super.key, required this.produk, required this.qty, required this.rank});

  final Produk produk;
  final int qty;
  final int rank;

  @override
  State<ItemLaris> createState() => _ItemLarisWidge();
}

class _ItemLarisWidge extends State<ItemLaris> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.green[500],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    widget.rank.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: accountProvider.getSetting('dark_mode')
                          ? Colors.black
                          : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: Text(
                      widget.produk.nama,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: Text(
                      "Terjual: ${widget.qty} / bulan",
                      style: TextStyle(fontSize: 15, color: Colors.green[500]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
