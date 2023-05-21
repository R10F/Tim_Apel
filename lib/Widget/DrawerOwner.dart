import 'package:flutter/material.dart';
import 'package:tim_apel/screen/DaftarStaf.dart';
import 'package:tim_apel/screen/ListStaf.dart';

class DrawerOwner extends StatelessWidget {
  const DrawerOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Image.asset(
            'assets/images/logo.png',
            width: 50,
          )),
          const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Center(
              child: Text(
                'Makmur App',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const Divider(
            height: 15,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Staf',
              style: TextStyle(
                  fontFamily: 'Figtree', fontSize: 16, color: Colors.grey[700]),
            ),
          ),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'List Staf',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const ListStaf()));
            },
          ),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                'Registrasi Staf',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const DaftarStaf()));
            },
          ),
          const Divider(
            height: 15,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Stok',
              style: TextStyle(
                fontFamily: 'Figtree',
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
          ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Segera Restock',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              onTap: () {}),
          const Divider(
            height: 15,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Analisis Penjualan',
              style: TextStyle(
                fontFamily: 'Figtree',
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
          ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Produk Terlaris',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              onTap: () {}),
          ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Produk Tidak laris',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              onTap: () {}),
        ],
      ),
    );
  }
}
