import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/form_handler/edit_nama_form_provider.dart';
import 'package:tim_apel/screens/profile/bottom_sheet.dart';
import 'package:tim_apel/screens/profile/personal_option.dart';
import 'package:tim_apel/providers/account_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, this.asMyself = true, this.id = -1, this.data});

  final int id;
  final bool asMyself;
  final dynamic data;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    var editNamaFormProvider = Provider.of<EditNamaFormProvider>(context);
    var bottomSheetEditNama = BottomSheetEditNama();

    String nama = accountProvider.currentUser.nama;
    String username = accountProvider.currentUser.username;
    bool isOwner = accountProvider.currentUser.isOwner;
    bool isActive = accountProvider.currentUser.isActive;
    String jadwal = accountProvider.currentUser.jadwal;
    String profilePicture = accountProvider.currentUser.profilePicture;

    if (!widget.asMyself) {
      nama = widget.data.nama;
      username = widget.data.username;
      isOwner = widget.data.isOwner;
      isActive = widget.data.isActive;
      jadwal = widget.data.jadwal;
      profilePicture = widget.data.profilePicture;
    }

    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 45),
          child: Center(
            child: Image.asset(
              'assets/profile_pictures/$profilePicture',
              width: 150,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25, left: 20),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nama',
                      style: TextStyle(fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Text(
                        nama,
                        style: const TextStyle(
                          fontFamily: 'Figtree',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                isActive
                    ? IconButton(
                        icon: const Icon(Icons.edit, color: Colors.grey),
                        onPressed: () {
                          int id = widget.id > -1 ? widget.id : accountProvider.id;
                          bottomSheetEditNama.showBottomSheet(
                              context, accountProvider, editNamaFormProvider, id, nama);
                        },
                      )
                    : Container()
              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Username',
              style: TextStyle(fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 20),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              username,
              style: const TextStyle(
                fontFamily: 'Figtree',
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Role',
              style: TextStyle(fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 20, bottom: 20),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              !isActive
                  ? 'Sudah Tidak Aktif'
                  : isOwner
                      ? 'Owner'
                      : 'Staf',
              style: const TextStyle(
                fontFamily: 'Figtree',
                fontSize: 20,
              ),
            ),
          ),
        ),
        const Divider(
          height: 15,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Jadwal',
              style: TextStyle(fontFamily: 'Figtree', fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 20, bottom: 20),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              jadwal,
              style: const TextStyle(
                fontFamily: 'Figtree',
                fontSize: 20,
              ),
            ),
          ),
        ),
        widget.asMyself || widget.id == accountProvider.id ? const PersonalOption() : Container(),
        const Padding(padding: EdgeInsets.only(bottom: 60))
      ]),
    );
  }
}
