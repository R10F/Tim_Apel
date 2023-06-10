import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/account_provider.dart';
import '../../profile/profile.dart';

class archieveAccount extends StatefulWidget {
  const archieveAccount({super.key});

  @override
  State<archieveAccount> createState() => _archieveAccountState();
}

class _archieveAccountState extends State<archieveAccount> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    var archieveAccount = accountProvider.getArchieveAccount;
    print(archieveAccount);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Staf'),
      ),
      body: ListView(
          children: List.generate(
        archieveAccount.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => Scaffold(
                        appBar: AppBar(
                          title: Text(archieveAccount[index].nama),
                        ),
                        body: Profile(
                            id: index,
                            asMyself: false,
                            data: archieveAccount[index]))));
          },
          child: Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListTile(
                  leading: Image.asset(
                    'assets/profile_pictures/${archieveAccount[index].profilePicture}',
                    width: 45,
                  ),
                  title: Text(archieveAccount[index].nama),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
