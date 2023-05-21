import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/provider/bottomNavbar_provider.dart';

class AppBarStaf extends StatelessWidget {
  const AppBarStaf({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomnavProvider = Provider.of<bottomNavbarProvider>(context);
    return AppBar(
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
                      ));
  }
}
