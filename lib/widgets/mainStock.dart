import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/screens/stokHabis.dart';
import 'package:tim_apel/screens/stokHampirHabis.dart';

import '../providers/account_provider.dart';

class MainStock extends StatefulWidget {
  const MainStock({super.key});

  @override
  State<MainStock> createState() => _MainStockState();
}

class _MainStockState extends State<MainStock> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Segera Restock",
          ),
          bottom: TabBar(
            labelPadding: const EdgeInsets.symmetric(horizontal: 12),
            labelStyle: const TextStyle(fontSize: 15),
            tabs: const [
              Tab(
                text: "Habis",
              ),
              Tab(
                text: "Hampir Habis",
              ),
            ],
            indicatorColor: Colours.lightSalmon,
            labelColor: Colours.lightSalmon,
            unselectedLabelColor: accountProvider.getSetting('dark_mode')
                ? Colors.white
                : Colors.black,
          ),
        ),
        body: const TabBarView(children: [StokHabis(), StokHampirHabis()]),
      ),
    );
  }
}
