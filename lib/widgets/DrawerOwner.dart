import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/screens/admin/account/register_staf.dart';
import 'package:tim_apel/screens/admin/account/list_staf.dart';

import '../providers/darkMode_provider.dart';

class DrawerOwner extends StatelessWidget {
  const DrawerOwner({super.key});

  @override
  Widget build(BuildContext context) {
    var darkModeSwitch = Provider.of<DarkModeProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: Divider.createBorderSide(context, width: 2))),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 75,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18, bottom: 15),
                    child: Center(
                      child: Text(
                        'Makmur App',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Text(
              'Staf',
              style: TextStyle(
                  fontFamily: 'Figtree',
                  fontSize: 16,
                  color: darkModeSwitch.getdarkModeswitchvalue
                      ? Colors.grey[300]
                      : Colors.grey[700]),
            ),
          ),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'List Staf',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const ListStaf()));
            },
          ),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                'Registrasi Staf',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DaftarStaf()));
            },
          ),
          const Divider(
            height: 15,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Text(
              'Stok',
              style: TextStyle(
                fontFamily: 'Figtree',
                fontSize: 16,
                color: darkModeSwitch.getdarkModeswitchvalue
                    ? Colors.grey[300]
                    : Colors.grey[700],
              ),
            ),
          ),
          ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Segera Restock',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              onTap: () {}),
          const Divider(
            height: 15,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Text(
              'Analisis Penjualan',
              style: TextStyle(
                fontFamily: 'Figtree',
                fontSize: 16,
                color: darkModeSwitch.getdarkModeswitchvalue
                    ? Colors.grey[300]
                    : Colors.grey[700],
              ),
            ),
          ),
          ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Produk Terlaris',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              onTap: () {}),
          ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Produk Tidak laris',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              onTap: () {}),
        ],
      ),
    );
  }
}
