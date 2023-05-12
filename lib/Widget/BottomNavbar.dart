import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/provider/bottomNavbar_provider.dart';
import 'package:tim_apel/screen/Home.dart';
import 'package:tim_apel/screen/Login.dart';
import 'package:tim_apel/screen/Produk.dart';
import 'package:tim_apel/screen/Transaksi.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List halamanBottomNav = [
    const Home(),
    const Produk(),
    const Transaksi(),
  ];

  @override
  Widget build(BuildContext context) {
    var bottomNav_Provider = Provider.of<bottomNavbarProvider>(context);
    return Scaffold(
        body: halamanBottomNav[bottomNav_Provider.getSelectedIdx],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Produk',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: 'Transaksi',
            ),
          ],
          currentIndex: bottomNav_Provider.getSelectedIdx,
          selectedItemColor: Colours.lightSalmon,
          onTap: (value) {
            bottomNav_Provider.setSelectedIdx = value;
          },
        ));
  }
}
