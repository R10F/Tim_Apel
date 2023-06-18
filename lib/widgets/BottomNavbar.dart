import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/bottom_navbar_provider.dart';
import 'package:tim_apel/screens/dashboard/home.dart';
import 'package:tim_apel/screens/profile/profile.dart';
import 'package:tim_apel/screens/produk/grid_produk.dart';
import 'package:tim_apel/screens/transaksi/list_transaksi.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List halamanBottomNav = [
    const Home(),
    const GridProduk(),
    const ListTransaksi(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    var bottomnavProvider = Provider.of<BottomNavbarProvider>(context);

    return BottomNavigationBar(
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
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: bottomnavProvider.getSelectedIdx,
      selectedItemColor: Colours.lightSalmon,
      onTap: (value) {
        bottomnavProvider.setSelectedIdx = value;
      },
      type: BottomNavigationBarType.fixed,
    );
  }
}
