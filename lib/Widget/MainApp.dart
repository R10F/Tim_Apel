import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/Widget/AppBarOwner.dart';
import 'package:tim_apel/Widget/AppBarStaf.dart';
import 'package:tim_apel/Widget/BottomNavbar.dart';
import 'package:tim_apel/Widget/DrawerOwner.dart';
import 'package:tim_apel/provider/bottomNavbar_provider.dart';
import 'package:tim_apel/screen/Home.dart';
import 'package:tim_apel/screen/Produk.dart';
import 'package:tim_apel/screen/Profile.dart';
import 'package:tim_apel/screen/Transaksi.dart';

import '../provider/SecureStorage_Provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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

    return DefaultTabController(
      length: bottomnavProvider.getSelectedIdx == 1 ? 5 : 2,
      child: Scaffold(
          appBar: StorageProvider.userRole == 'Owner'
              ? PreferredSize(
                  preferredSize: bottomnavProvider.getSelectedIdx == 1 ||
                          bottomnavProvider.getSelectedIdx == 2
                      ? const Size.fromHeight(
                          kToolbarHeight + kTextTabBarHeight)
                      : const Size.fromHeight(kToolbarHeight),
                  child: const AppBarOwner(),
                )
              : PreferredSize(
                  preferredSize: bottomnavProvider.getSelectedIdx == 1 ||
                          bottomnavProvider.getSelectedIdx == 2
                      ? const Size.fromHeight(
                          kToolbarHeight + kTextTabBarHeight)
                      : const Size.fromHeight(kToolbarHeight),
                  child: const AppBarStaf(),
                ),
          body: halamanBottomNav[bottomnavProvider.getSelectedIdx],
          drawer: StorageProvider.userRole == 'Owner' &&
                  bottomnavProvider.getSelectedIdx == 0
              ? const DrawerOwner()
              : null,
          bottomNavigationBar: const BottomNavbar()),
    );
  }
}
