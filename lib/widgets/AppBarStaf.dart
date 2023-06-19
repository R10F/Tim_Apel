import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/bottom_navbar_provider.dart';
import 'package:tim_apel/widgets/CustomProdukSearch.dart';
import 'package:tim_apel/widgets/TabNavigasiProduk.dart';
import 'package:tim_apel/widgets/TabNavigasiTransaksi.dart';

class AppBarStaf extends StatelessWidget {
  const AppBarStaf({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomNavProvider = Provider.of<BottomNavbarProvider>(context);

    return AppBar(
        actions: [
          if (bottomNavProvider.getSelectedIdx == 1) // Search icon - Page Produk
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomProdukSearch());
                },
                icon: const Icon(Icons.search)),
          if (bottomNavProvider.getSelectedIdx == 1) // Cart icon - Page Produk
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomProdukSearch());
                },
                icon: const Icon(Icons.receipt_long))
        ],
        title: (bottomNavProvider.getSelectedIdx == 0)
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
            : (bottomNavProvider.getSelectedIdx == 1)
                ? const Text(
                    "Produk",
                  )
                : (bottomNavProvider.getSelectedIdx == 2)
                    ? const Text(
                        'Transaksi',
                      )
                    : const Text(
                        'Profile',
                      ),
        bottom: bottomNavProvider.getSelectedIdx == 1
            ? const PreferredSize(
                preferredSize: Size.fromHeight(kTextTabBarHeight), child: TabNavigasiProduk())
            : bottomNavProvider.getSelectedIdx == 2
                ? const PreferredSize(
                    preferredSize: Size.fromHeight(kTextTabBarHeight),
                    child: TabNavigasiTransaksi())
                : null);
  }
}
