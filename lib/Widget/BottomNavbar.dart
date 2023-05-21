import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/Widget/AppBarOwner.dart';
import 'package:tim_apel/Widget/AppBarStaf.dart';
import 'package:tim_apel/Widget/DrawerOwner.dart';
import 'package:tim_apel/provider/bottomNavbar_provider.dart';
import 'package:tim_apel/screen/Home.dart';
import 'package:tim_apel/screen/Produk.dart';
import 'package:tim_apel/screen/Profile.dart';
import 'package:tim_apel/screen/Transaksi.dart';

import '../provider/Login_provider.dart';
import '../provider/SecureStorage_Provider.dart';

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
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    var bottomnavProvider = Provider.of<bottomNavbarProvider>(context);
    var StorageProvider = Provider.of<SecureStorageProvider>(context);

    return Scaffold(
        appBar: StorageProvider.userRole == 'Owner'
            ? PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: AppBarOwner(),
              )
            : PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: AppBarStaf(),
              ),
        body: halamanBottomNav[bottomnavProvider.getSelectedIdx],
        drawer:
            StorageProvider.userRole == 'Owner' ? const DrawerOwner() : null,
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
        ));
  }
}
