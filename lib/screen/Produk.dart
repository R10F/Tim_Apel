import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/darkMode_provider.dart';

class Produk extends StatefulWidget {
  const Produk({super.key});

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  @override
  Widget build(BuildContext context) {
    var darkModeSwitch = Provider.of<DarkModeProvider>(context);
    return SingleChildScrollView(
      child: DefaultTabController(
        length: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color:
                  darkModeSwitch.getdarkModeswitchvalue ? null : Colors.white,
              child: TabBar(
                isScrollable: true,
                tabs: <Tab>[
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
                unselectedLabelColor: darkModeSwitch.getdarkModeswitchvalue
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                children: <Widget>[
                  Center(child: Text('Tab 1 Content')),
                  Center(child: Text('Tab 2 Content')),
                  Center(child: Text('Tab 3 Content')),
                  Center(child: Text('Tab 4 Content')),
                  Center(child: Text('Tab 5 Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
