import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/widgets/AppBarOwner.dart';
import 'package:tim_apel/widgets/AppBarStaf.dart';
import 'package:tim_apel/widgets/BottomNavbar.dart';
import 'package:tim_apel/widgets/DrawerOwner.dart';
import 'package:tim_apel/providers/bottom_navbar_provider.dart';
import 'package:tim_apel/screens/dashboard/home.dart';
import 'package:tim_apel/screens/produk/grid_produk.dart';
import 'package:tim_apel/screens/produk/tambah_produk.dart';
import 'package:tim_apel/screens/profile/profile.dart';
import 'package:tim_apel/screens/transaksi/list_transaksi.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List halamanBottomNav = [
    const Home(),
    const GridProduk(),
    const ListTransaksi(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    var transaksiProvider = Provider.of<TransaksiProvider>(context);
    var bottomnavProvider = Provider.of<BottomNavbarProvider>(context);

    Future<void> addProdukAndShowMessage(BuildContext context) async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TambahProduk(), fullscreenDialog: true),
      );
      //temp dlu utk message setelah berhasil ditambahkan
      // if (! mounted) return;
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Berhasil menambah produk')),
      // );
    }

    return DefaultTabController(
      length: bottomnavProvider.getSelectedIdx == 1 ? 5 : 2,
      child: Scaffold(
        appBar: accountProvider.isOwner
            ? PreferredSize(
                preferredSize:
                    bottomnavProvider.getSelectedIdx == 1 || bottomnavProvider.getSelectedIdx == 2
                        ? const Size.fromHeight(kToolbarHeight + kTextTabBarHeight)
                        : const Size.fromHeight(kToolbarHeight),
                child: const AppBarOwner(),
              )
            : PreferredSize(
                preferredSize:
                    bottomnavProvider.getSelectedIdx == 1 || bottomnavProvider.getSelectedIdx == 2
                        ? const Size.fromHeight(kToolbarHeight + kTextTabBarHeight)
                        : const Size.fromHeight(kToolbarHeight),
                child: const AppBarStaf(),
              ),
        body: halamanBottomNav[bottomnavProvider.getSelectedIdx],
        drawer: accountProvider.isOwner &&
                (bottomnavProvider.getSelectedIdx == 0 || bottomnavProvider.getSelectedIdx == 3)
            ? const DrawerOwner()
            : null,
        bottomNavigationBar: const BottomNavbar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: accountProvider.isOwner && bottomnavProvider.getSelectedIdx == 1
            ? SpeedDial(
                animatedIcon: AnimatedIcons.menu_close,
                backgroundColor: Colors.teal[700],
                foregroundColor:
                    accountProvider.getSetting('dark_mode') ? Colors.white70 : Colors.white,
                childMargin: const EdgeInsets.all(20),
                children: [
                    SpeedDialChild(
                        label: 'Buat Order Baru',
                        child: const Icon(Icons.add_shopping_cart),
                        onTap: () {
                          transaksiProvider.createNewOrder(accountProvider.id);

                          Fluttertoast.showToast(
                            msg: 'Order baru berhasil dibuat',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            backgroundColor: Colors.teal[300],
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        }),
                    SpeedDialChild(
                        label: 'Tambah Produk',
                        child: const Icon(Icons.pallet),
                        onTap: () {
                          addProdukAndShowMessage(context);
                        }),
                  ])
            : FloatingActionButton(
                onPressed: () {
                  transaksiProvider.createNewOrder(accountProvider.id);

                  Fluttertoast.showToast(
                    msg: 'Order baru berhasil dibuat',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.teal[300],
                    textColor: Colors.white,
                    fontSize: 16,
                  );
                },
                tooltip: 'Buat Order Baru',
                backgroundColor: Colors.teal[700],
                child: Icon(Icons.add_shopping_cart,
                    color: accountProvider.getSetting('dark_mode') ? Colors.white70 : Colors.white),
              ),
      ),
    );
  }
}
