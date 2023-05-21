import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/Widget/DrawerOwner.dart';
import 'package:tim_apel/provider/bottomNavbar_provider.dart';
import 'package:tim_apel/screen/Home.dart';
import 'package:tim_apel/screen/Produk.dart';
import 'package:tim_apel/screen/Profile.dart';
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
    const Profile()
  ];
  
  @override
  Widget build(BuildContext context) {
    var bottomnavProvider = Provider.of<bottomNavbarProvider>(context);

    return Scaffold(
        appBar: AppBar(
            // iconTheme: const IconThemeData(color: Colors.black),
            title: (bottomnavProvider.getSelectedIdx == 0)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 48,
                        width: 48,
                      ),
                    ],
                  )
                : (bottomnavProvider.getSelectedIdx == 1)
                    ? const Text(
                        "Produk",
                      )
                    : (bottomnavProvider.getSelectedIdx == 2)
                        ? const Text(
                            'Transaksi',
                          )
                        : const Text(
                            'Profile',
                          ), 
        ),
        body: halamanBottomNav[bottomnavProvider.getSelectedIdx],
        drawer: DrawerOwner(),
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
