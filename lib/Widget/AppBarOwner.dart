import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/provider/bottomNavbar_provider.dart';

class AppBarOwner extends StatelessWidget {
  const AppBarOwner({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomnavProvider = Provider.of<bottomNavbarProvider>(context);
    return AppBar(
        title: (bottomnavProvider.getSelectedIdx == 0)
            ? const Text('Makmur App')
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
