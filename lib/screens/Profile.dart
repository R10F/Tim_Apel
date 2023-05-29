import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/darkMode_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool berandaMinimal = false;
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.asset(
            'assets/images/profile.png',
            width: 100,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text(
          'Nama',
          style: TextStyle(
              fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 20),
        child: Text(
          accountProvider.currentUser['nama'],
          style: const TextStyle(
            fontFamily: 'Figtree',
            fontSize: 20,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text(
          'Username',
          style: TextStyle(
              fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 20),
        child: Text(
          accountProvider.currentUser['username'],
          style: const TextStyle(
            fontFamily: 'Figtree',
            fontSize: 20,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text(
          'Role',
          style: TextStyle(
              fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, bottom: 20),
        child: Text(
          accountProvider.isOwner ? 'Owner' : 'Staf',
          style: const TextStyle(
            fontFamily: 'Figtree',
            fontSize: 20,
          ),
        ),
      ),
      const Divider(
        height: 15,
        thickness: 2,
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text(
          'Jadwal',
          style: TextStyle(
              fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, bottom: 20),
        child: Text(
          accountProvider.currentUser['jadwal'],
          style: const TextStyle(
            fontFamily: 'Figtree',
            fontSize: 20,
          ),
        ),
      ),
      const Divider(
        height: 15,
        thickness: 2,
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text(
          'Preferensi',
          style: TextStyle(
              fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 5),
        child: ListTile(
          title: const Text(
            'Dark Mode',
            style: TextStyle(
              fontFamily: 'Figtree',
              fontSize: 20,
            ),
          ),
          trailing: Switch(
            value: accountProvider.getSetting('dark_mode'),
            onChanged: (value) {
              accountProvider.setSetting('dark_mode', value);
            },
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 5),
        child: ListTile(
          title: const Text(
            'Beranda Minimal',
            style: TextStyle(
              fontFamily: 'Figtree',
              fontSize: 20,
            ),
          ),
          subtitle: const Text(
            'Menyembunyikan info transaksi pada beranda',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing: Switch(
            value: accountProvider.getSetting('dashboard_minimal'),
            onChanged: (value) {
              accountProvider.setSetting('dashboard_minimal', value);
            },
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ElevatedButton(
            onPressed: () async {
              accountProvider.logout();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
            child: const Text('Logout'),
          )),
    ]);
  }
}
