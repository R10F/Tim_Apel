import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';

class TabNavigasiTransaksi extends StatelessWidget {
  const TabNavigasiTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    
    return TabBar(
      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
      labelStyle: const TextStyle(fontSize: 15),
      tabs: const [
        Tab(
          text: "Dalam Proses",
        ),
        Tab(text: "Selesai"),
      ],
      indicatorColor: Colours.lightSalmon,
      labelColor: Colours.lightSalmon[500],
      unselectedLabelColor:
          accountProvider.getSetting('dark_mode') ? Colors.white : Colors.black,
    );
  }
}
