import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/darkMode_provider.dart';

class TabNavigasiProduk extends StatelessWidget {
  const TabNavigasiProduk({super.key});

  @override
  Widget build(BuildContext context) {
    var darkModeSwitch = Provider.of<DarkModeProvider>(context);
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
      unselectedLabelColor:
          darkModeSwitch.getdarkModeswitchvalue ? Colors.white : Colors.black,
    );
  }
}
