import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/screens/admin/account/register_staf.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/screens/profile/profile.dart';

class ListStaf extends StatefulWidget {
  const ListStaf({super.key});

  @override
  State<ListStaf> createState() => _ListStafState();
}

class _ListStafState extends State<ListStaf> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    var userAccounts = accountProvider.userAccounts;
    print(userAccounts);
    print(accountProvider.id);
    print(accountProvider.isOwner);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Staf'),
      ),
      body: ListView(
          children: List.generate(
        userAccounts.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => Scaffold(
                        appBar: AppBar(
                          title: Text(userAccounts[index].nama),
                        ),
                        body: Profile(
                            id: index,
                            asMyself: false,
                            data: userAccounts[index]))));
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
                    'assets/profile_pictures/${userAccounts[index].profilePicture}',
                    width: 45,
                  ),
                  title: Text(userAccounts[index].nama),
                  trailing: accountProvider.id != index
                      ? IconButton(
                          onPressed: () {
                            accountProvider
                                .archieveAccounts(userAccounts[index]);

                            accountProvider.removeAccount(index);
                            CherryToast.success(
                              title: Text("Staf Berhasil Diarsipkan"),
                              toastPosition: Position.top,
                              animationDuration: Duration(milliseconds: 500),
                              autoDismiss: true,
                            ).show(context);
                          },
                          icon: const Icon(Icons.archive))
                      : null,
                ),
              ),
            ),
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal[700],
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const RegisterStaf()));
        },
      ),
    );
  }
}
