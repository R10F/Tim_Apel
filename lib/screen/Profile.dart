import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tim_apel/provider/darkMode_provider.dart';
import 'package:tim_apel/screen/Login.dart';

import '../provider/SharedPreferences_Provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool berandaMinimal = false;
  @override
  Widget build(BuildContext context) {
    var darkModeSwitch = Provider.of<DarkModeProvider>(context);
    var SharedPreferProvider = Provider.of<SharedPreferenceProvider>(context);
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
      const Padding(
        padding: EdgeInsets.only(top: 5, left: 20),
        child: Text(
          'Athalia',
          style: TextStyle(
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
      const Padding(
        padding: EdgeInsets.only(top: 5, left: 20),
        child: Text(
          'Role',
          style: TextStyle(
            fontFamily: 'Figtree',
            fontSize: 20,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text(
          'Staf',
          style: TextStyle(
              fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 5, left: 20, bottom: 15),
        child: Text(
          'Athalia',
          style: TextStyle(
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
      const Padding(
        padding: EdgeInsets.only(
          top: 5,
          left: 20,
        ),
        child: Text(
          'Senin',
          style: TextStyle(
            fontFamily: 'Figtree',
            fontSize: 20,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 5, left: 20, bottom: 15),
        child: Text(
          '08.00 - 12.30',
          style: TextStyle(
            fontFamily: 'Figtree',
            fontSize: 20,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(
          top: 5,
          left: 20,
        ),
        child: Text(
          'Selasa',
          style: TextStyle(
            fontFamily: 'Figtree',
            fontSize: 20,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 5, left: 20, bottom: 15),
        child: Text(
          '13.00 - 15.00',
          style: TextStyle(
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
            value: darkModeSwitch.getdarkModeswitchvalue,
            onChanged: (value) {
              darkModeSwitch.setdarkModeswitchValue = value;
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
            value: berandaMinimal,
            onChanged: (value) {
              setState(() {
                berandaMinimal = value;
              });
            },
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ElevatedButton(
            onPressed: () {
              print("info Login ${SharedPreferProvider.isLogin}");
              SharedPreferProvider.removeLogin();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const Login()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
            child: const Text('Logout'),
          )),
    ]);
  }
}
