import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/darkMode_provider.dart';

class TabNavigasiTransaksi extends StatelessWidget {
  const TabNavigasiTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    var darkModeSwitch = Provider.of<DarkModeProvider>(context);
    return TabBar(
      isScrollable: true,
      tabs: const [
        Tab(
          text: "Dalam Proses",
        ),
        Tab(text: "Selesai"),
      ],
      indicatorColor: Colours.lightSalmon,
      labelColor: Colours.lightSalmon[500],
      unselectedLabelColor:
          darkModeSwitch.getdarkModeswitchvalue ? Colors.white : Colors.black,
    );
  }
}
