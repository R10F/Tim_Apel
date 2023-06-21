import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';

class TabNavigasiProduk extends StatelessWidget {
  const TabNavigasiProduk({super.key});

  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);

    return TabBar(
      isScrollable: true,
      tabs: const [
        Tab(
          text: "All",
        ),
        Tab(text: "ATK"),
        Tab(text: "Craft Supply"),
        Tab(text: "Keperluan Jahit"),
        Tab(text: "Dekorasi"),
      ],
      indicatorColor: Colours.lightSalmon,
      labelColor: Colours.lightSalmon,
      unselectedLabelColor: accountProvider.getSetting('dark_mode') ? Colors.white : Colors.black,
    );
  }
}
