import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/form_handler/produk_form_provider.dart';

import '../providers/produk_provider.dart';
import '../screens/EditProduk.dart';

class PopupMenu extends StatelessWidget {
  final int idxProduk;
  const PopupMenu({super.key, required this.idxProduk});

  @override
  Widget build(BuildContext context) {
    var produkProv = Provider.of<ProdukProvider>(context);
    var formProv = Provider.of<ProdukFormProvider>(context);
    var toBeEdited = produkProv.getProduk(idxProduk - 1);
    
    void updateFormProvider(){
      formProv.namaProdukController.text = toBeEdited.nama;
      formProv.deskripsiController.text = toBeEdited.deskripsi;
      formProv.stokController.text = toBeEdited.stok;
      formProv.hargaJualController.text = toBeEdited.hargaJual;
      formProv.hargaBeliController.text = toBeEdited.hargaBeli;
      formProv.updateKategori = toBeEdited.kategori;
      formProv.updateEditIdx = toBeEdited.id - 1;
    }

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'edit'){
          updateFormProvider();
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
