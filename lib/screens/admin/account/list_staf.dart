import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/screens/admin/account/register_staf.dart';
import 'package:tim_apel/providers/auth_provider.dart';

class ListStaf extends StatefulWidget {
  const ListStaf({super.key});

  @override
  State<ListStaf> createState() => _ListStafState();
}

class _ListStafState extends State<ListStaf> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userAccounts = authProvider.userAccounts;
    print(userAccounts);
    print(authProvider.id);
    print(authProvider.isOwner);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Staf'),
      ),
      body: ListView(
          children: List.generate(
        userAccounts.length,
        (index) => Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ListTile(
                leading: Image.asset(
                  'assets/images/profile.png',
                  width: 45,
                ),
                title: Text(userAccounts[index]['nama']),
                trailing: (!authProvider.isOwner || authProvider.id != index)
                    ? IconButton(
                        onPressed: () {
                          authProvider.removeAccount(index);
                        },
                        icon: const Icon(Icons.delete))
                    : null,
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
