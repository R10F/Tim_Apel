import 'package:flutter/material.dart';

class BottomSheetEditNama {
  void showBottomSheet(BuildContext context, var prov, var formProv) {
    formProv.nama = prov.currentUser['nama'];

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Edit Nama',
                    style:
                        TextStyle(fontFamily: 'Figtree', fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: TextFormField(
                    controller: formProv.namaController,
                    decoration: InputDecoration(
                        errorText: formProv.isEmpty ? 'Nama tidak boleh kosong' : null,
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            formProv.namaController.clear();
                          },
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: FractionallySizedBox(
                    widthFactor: 0.75,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
                        onPressed: () {
                          formProv.isEmpty = formProv.namaController.text.isEmpty;
                          showBottomSheet(context, prov, formProv);
                          print(formProv.isEmpty);

                          if (!formProv.isEmpty) {
                            prov.changeNama = formProv.namaController.text;
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('Simpan')),
                  ),
                ),
                const Text('Harap isi dengan nama yang mudah dikenali.'),
              ],
            ),
          ),
        );
      },
    );
  }
}
