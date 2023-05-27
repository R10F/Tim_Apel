import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/widgets/AppBarOwner.dart';
import 'package:tim_apel/widgets/AppBarStaf.dart';
import 'package:tim_apel/widgets/BottomNavbar.dart';
import 'package:tim_apel/widgets/DrawerOwner.dart';
import 'package:tim_apel/providers/bottomNavbar_provider.dart';
import 'package:tim_apel/screens/Home.dart';
import 'package:tim_apel/screens/Produk.dart';
import 'package:tim_apel/screens/Profile.dart';
import 'package:tim_apel/screens/Transaksi.dart';

import '../providers/SecureStorage_Provider.dart';

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

    return Scaffold(
        appBar: StorageProvider.userRole == 'Owner'
            ? const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: AppBarOwner(),
              )
            : const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: AppBarStaf(),
              ),
        body: halamanBottomNav[bottomnavProvider.getSelectedIdx],
        drawer: StorageProvider.userRole == 'Owner' &&
                bottomnavProvider.getSelectedIdx == 0
            ? const DrawerOwner()
            : null,
        bottomNavigationBar: const BottomNavbar());
  }
}
