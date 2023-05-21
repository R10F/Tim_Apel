import 'package:flutter/material.dart';

class DrawerOwner extends StatelessWidget {
  const DrawerOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: ListView(
          children: [
            Image.asset('assets/images/logo.png'),
            Text(
              'Makmur App',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
