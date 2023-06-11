import 'package:flutter/material.dart';

import '../screens/EditProduk.dart';

class PopupMenu extends StatelessWidget {
  final int idxProduk;
  const PopupMenu({super.key, required this.idxProduk});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'edit'){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => EditProduk(idxProduk: idxProduk,), 
            fullscreenDialog: true),
          );
        }
        else if (value == 'hapus'){
          
        }
      },
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          const PopupMenuItem(
              value: 'edit',
              child: ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit'),
          )),
          const PopupMenuDivider(),
          const PopupMenuItem(
            value: 'hapus',
            child: ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Hapus'),
          )),
        ];
      },
    );
  }
}
