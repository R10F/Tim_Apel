// import 'package:cherry_toast/cherry_toast.dart';
// import 'package:cherry_toast/resources/arrays.dart';
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tim_apel/screens/profile/profile.dart';

class ListStafItem extends StatefulWidget {
  const ListStafItem(
      {super.key,
      required this.index,
      required this.userAccounts,
      required this.isActiveAccountsPage,
      required this.accountProvider});

  final int index;
  final List userAccounts;
  final bool isActiveAccountsPage;
  final accountProvider;

  @override
  State<ListStafItem> createState() => _ListStafItemState();
}

class _ListStafItemState extends State<ListStafItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => Scaffold(
                    appBar: AppBar(
                      title: Text(widget.userAccounts[widget.index].nama),
                    ),
                    body: Profile(
                        id: widget.index,
                        asMyself: false,
                        data: widget.userAccounts[widget.index]))));
      },
      child: Column(
        children: [
          Container(
            // decoration:
            //     const BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
            padding: widget.isActiveAccountsPage
                ? const EdgeInsets.only(left: 12)
                : const EdgeInsets.only(top: 0),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Image.asset(
                    'assets/profile_pictures/${widget.userAccounts[widget.index].profilePicture}',
                    width: 45,
                  ),
                  title: Text(widget.userAccounts[widget.index].nama),
                  trailing: widget.accountProvider.id != widget.index
                      ? widget.isActiveAccountsPage
                          ? TextButton(
                              onPressed: () {
                                QuickAlert.show(
                                    context: context,
                                    confirmBtnTextStyle: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    cancelBtnTextStyle: const TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    type: QuickAlertType.warning,
                                    confirmBtnColor: Colors.teal[700]!,
                                    title: 'Nonaktifkan staf ini?',
                                    confirmBtnText: 'Nonaktifkan',
                                    cancelBtnText: 'Tutup',
                                    showCancelBtn: true,
                                    onConfirmBtnTap: () {
                                      widget.accountProvider
                                          .deactivateAccount(widget.index);
                                      Navigator.pop(context);
                                    });
                              },
                              child: Text(
                                'Nonaktifkan',
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontSize),
                              ))
                          : TextButton(
                              onPressed: () {
                                widget.accountProvider
                                    .activateAccount(widget.index);

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
          widget.index > 0
              ? Divider(
                  color: Colors.teal[300],
                  thickness: 0.35,
                  indent: widget.isActiveAccountsPage ? 20 : 0)
              : Container(),
        ],
      ),
    );
  }
}
