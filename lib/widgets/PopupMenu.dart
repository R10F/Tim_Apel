import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return
    PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              onTap: (){},
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
            )
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: (){},
              leading: const Icon(Icons.delete),
              title: const Text('Hapus'),
            )
          ),
        ];
      },
    );
  }
}