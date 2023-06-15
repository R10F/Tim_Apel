// import 'package:cherry_toast/cherry_toast.dart';
// import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/screens/admin/account/register_staf.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/screens/profile/profile.dart';

class ListStaf extends StatefulWidget {
  const ListStaf({super.key, required this.isActiveAccounts});

  final bool isActiveAccounts;

  @override
  State<ListStaf> createState() => _ListStafState();
}

class _ListStafState extends State<ListStaf> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    var userAccounts = accountProvider.userAccounts;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isActiveAccounts ? 'List Staf' : 'Staf Nonaktif'),
      ),
      body: ListView(
          children: List.generate(
              userAccounts.length,
              (index) => userAccounts[index].isActive == widget.isActiveAccounts
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
                                        id: index, asMyself: false, data: userAccounts[index]))));
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
                              trailing: accountProvider.id != index && userAccounts[index].isActive
                                  ? IconButton(
                                      onPressed: () {
                                        accountProvider.archieveAccounts(index);

                                        // accountProvider.removeAccount(index);
                                        // CherryToast.success(
                                        //   title: const Text("Staf Berhasil Diarsipkan"),
                                        //   toastPosition: Position.top,
                                        //   animationDuration: const Duration(milliseconds: 500),
                                        //   autoDismiss: true,
                                        // ).show(context);
                                        Fluttertoast.showToast(
                                          msg: 'Staf Berhasil Diarsipkan',
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.TOP,
                                          // timeInSecForIosWeb: 10,
                                          backgroundColor: Colors.teal[300],
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                      },
                                      icon: const Icon(Icons.archive))
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container())),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal[700],
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterStaf()));
        },
      ),
    );
  }
}
