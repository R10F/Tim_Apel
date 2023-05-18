import 'package:flutter/material.dart';

class AppBarOwner extends StatefulWidget implements PreferredSizeWidget {
  const AppBarOwner({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppBarOwner> createState() => _AppBarOwnerState();
}

class _AppBarOwnerState extends State<AppBarOwner> {
  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
