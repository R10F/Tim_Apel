// import 'package:cherry_toast/cherry_toast.dart';
// import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tim_apel/screens/admin/account/list_staf_item.dart';
import 'package:tim_apel/screens/admin/account/register_staf.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/screens/profile/profile.dart';

class ListStaf extends StatefulWidget {
  const ListStaf({super.key, required this.isActiveAccountsPage});

  final bool isActiveAccountsPage;

  @override
  State<ListStaf> createState() => _ListStafState();
}

class _ListStafState extends State<ListStaf> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    List userAccounts = accountProvider.userAccounts;

    int itemCount = 0;
    for (int i = 0; i < userAccounts.length; i++) {
      if (userAccounts[i].isActive == widget.isActiveAccountsPage) {
        itemCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isActiveAccountsPage ? 'List Staf' : 'Staf Nonaktif'),
      ),
      body: itemCount > 0
          ? Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListView(children: [
                widget.isActiveAccountsPage
                    ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 6, left: 15, bottom: 6),
                          child: Text('Owner',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                        ),
                        Divider(color: Colors.teal[300], thickness: 0.75),
                        userAccounts[0].isActive == widget.isActiveAccountsPage
                            ? ListStafItem(
                                index: 0,
                                userAccounts: userAccounts,
                                accountProvider: accountProvider,
                                isActiveAccountsPage: widget.isActiveAccountsPage)
                            : Container(),
                        Divider(color: Colors.teal[300], thickness: 0.75),
                        widget.isActiveAccountsPage
                            ? const Padding(
                                padding: EdgeInsets.only(top: 6, left: 15, bottom: 6),
                                child: Text('Staf',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                              )
                            : Container(),
                        Divider(color: Colors.teal[300], thickness: 0.75),
                      ])
                    : Container(),
                if (itemCount > 1)
                  for (int i = 1; i < userAccounts.length; i++)
                    if (userAccounts[i].isActive == widget.isActiveAccountsPage)
                      ListStafItem(
                          index: i,
                          userAccounts: userAccounts,
                          accountProvider: accountProvider,
                          isActiveAccountsPage: widget.isActiveAccountsPage),
                if (itemCount == 1)
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 16),
                      child: const Text(
                        'Tidak ada staf aktif',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
              ]),
            )
          : Center(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Tidak ada staf nonaktif',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
      floatingActionButton: widget.isActiveAccountsPage
          ? FloatingActionButton.extended(
              backgroundColor: Colors.teal[700],
              icon: const Icon(Icons.add),
              label: Text(
                'Tambah',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterStaf()));
              },
            )
          : null,
    );
  }
}
