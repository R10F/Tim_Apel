import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';

class PersonalOption extends StatefulWidget {
  const PersonalOption({super.key});

  @override
  State<PersonalOption> createState() => _PersonalOptionState();
}

class _PersonalOptionState extends State<PersonalOption> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);

    return Column(children: [
      const Divider(
        height: 15,
        thickness: 2,
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20, bottom: 10),
        child: Text(
          'Preferensi',
          style: TextStyle(
              fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5),
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
        padding: const EdgeInsets.only(left: 5),
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
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Row(children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                accountProvider.logout();
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
              child: const Text('Logout'),
            ),
          ),
        ]),
      ),
    ]);
  }
}
