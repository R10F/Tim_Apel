import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/widgets/AppBarOwner.dart';
import 'package:tim_apel/widgets/AppBarStaf.dart';
import 'package:tim_apel/widgets/BottomNavbar.dart';
import 'package:tim_apel/widgets/DrawerOwner.dart';
import 'package:tim_apel/providers/bottomNavbar_provider.dart';
import 'package:tim_apel/screens/dashboard/home.dart';
import 'package:tim_apel/screens/Produk.dart';
import 'package:tim_apel/screens/profile.dart';
import 'package:tim_apel/screens/Transaksi.dart';
import '../screens/Produk2.dart';

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
    var accountProvider = Provider.of<AccountProvider>(context);
    var bottomnavProvider = Provider.of<bottomNavbarProvider>(context);

    return DefaultTabController(
      length: bottomnavProvider.getSelectedIdx == 1 ? 5 : 2,
      child: Scaffold(
        appBar: accountProvider.isOwner
            ? PreferredSize(
                preferredSize: bottomnavProvider.getSelectedIdx == 1 ||
                        bottomnavProvider.getSelectedIdx == 2
                    ? const Size.fromHeight(kToolbarHeight + kTextTabBarHeight)
                    : const Size.fromHeight(kToolbarHeight),
                child: const AppBarOwner(),
              )
            : PreferredSize(
                preferredSize: bottomnavProvider.getSelectedIdx == 1 ||
                        bottomnavProvider.getSelectedIdx == 2
                    ? const Size.fromHeight(kToolbarHeight + kTextTabBarHeight)
                    : const Size.fromHeight(kToolbarHeight),
                child: const AppBarStaf(),
              ),
        body: halamanBottomNav[bottomnavProvider.getSelectedIdx],
        drawer: accountProvider.isOwner && bottomnavProvider.getSelectedIdx == 0
            ? const DrawerOwner()
            : null,
        bottomNavigationBar: const BottomNavbar(),
        floatingActionButton:
            accountProvider.isOwner && bottomnavProvider.getSelectedIdx == 1
                ? FloatingActionButton.extended(
                    onPressed: () {},
                    label: const Text("Tambah"),
                    icon: const Icon(Icons.add),
                  )
                : null,
      ),
    );
  }
}
