// import 'package:cherry_toast/cherry_toast.dart';
// import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
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
          ? ListView(
              children: List.generate(
                  userAccounts.length,
                  (index) => userAccounts[index].isActive == widget.isActiveAccountsPage
                      ? GestureDetector(
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
                                border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
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
                                      ? widget.isActiveAccountsPage
                                          ? TextButton(
                                              onPressed: () {
                                                QuickAlert.show(
                                                    context: context,
                                                    type: QuickAlertType.warning,
                                                    confirmBtnColor: Colors.teal[700]!,
                                                    title: 'Nonaktifkan staf ini?',
                                                    confirmBtnText: 'Nonaktifkan',
                                                    cancelBtnText: 'Tutup',
                                                    showCancelBtn: true,
                                                    onConfirmBtnTap: () {
                                                      accountProvider.deactivateAccount(index);
                                                      Navigator.pop(context);
                                                    });
                                              },
                                              child: const Text('Nonaktifkan'))
                                          : TextButton(
                                              onPressed: () {
                                                accountProvider.activateAccount(index);

                                                Fluttertoast.showToast(
                                                  msg: 'Staf sudah diaktifkan kembali',
                                                  toastLength: Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.TOP,
                                                  backgroundColor: Colors.teal[300],
                                                  textColor: Colors.white,
                                                  fontSize: 16,
                                                );
                                              },
                                              child: const Text('Aktifkan'))
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container()))
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
