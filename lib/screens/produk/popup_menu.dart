import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tim_apel/providers/form_handler/produk_form_provider.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/screens/produk/edit_produk.dart';
import 'package:tim_apel/utilities/formatting.dart';

class PopupMenu extends StatefulWidget {
  final int idxProduk;
  const PopupMenu({super.key, required this.idxProduk});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    var produkProv = Provider.of<ProdukProvider>(context);
    var formProv = Provider.of<ProdukFormProvider>(context);
    var toBeEdited = produkProv.getProduk(widget.idxProduk - 1);
    var nama = toBeEdited.stok;

    void _updateFormProvider() {
      formProv.namaProdukController.text = toBeEdited.nama;
      formProv.deskripsiController.text = toBeEdited.deskripsi;
      formProv.stokController.text = toBeEdited.stok.toString();
      formProv.hargaJualController.text =
          currency(toBeEdited.hargaJual).toString();
      formProv.hargaBeliController.text =
          currency(toBeEdited.hargaBeli).toString();
      formProv.updateKategori = toBeEdited.kategori;
      formProv.updateEditIdx = 1;
    }

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'edit') {
          _updateFormProvider();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditProduk(
                      idxProduk: widget.idxProduk,
                    ),
                fullscreenDialog: true),
          );
        } else if (value == 'hapus') {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.warning,
              confirmBtnColor: Colors.teal[700]!,
              title: 'Hapus ${toBeEdited.nama}?',
              confirmBtnText: 'Hapus',
              cancelBtnText: 'Tutup',
              showCancelBtn: true,
              onConfirmBtnTap: () {
                produkProv.hapusProduk(widget.idxProduk);
                Navigator.pop(context);
              });
        }
      },
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          const PopupMenuItem(
              value: 'edit',
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
              )),
          const PopupMenuItem(
              value: 'hapus',
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text('Hapus'),
              )),
        ];
      },
    );
  }
}
