import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottomNavbar_provider.dart';

class AppBarStaf extends StatefulWidget implements PreferredSizeWidget {
  const AppBarStaf({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppBarStaf> createState() => _AppBarStafState();
}

class _AppBarStafState extends State<AppBarStaf> {
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
