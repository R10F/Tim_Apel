import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomSheetEditNama {
  showBottomSheet(BuildContext context, var prov, var formProv, int index, String nama) {
    formProv.nama = nama;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Edit Nama',
                      style: TextStyle(
                          fontFamily: 'Figtree', fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
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
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
                          onPressed: () {
                            formProv.setisEmpty = formProv.namaController.text.isEmpty;

                            if (!formProv.isEmpty) {
                              prov.changeNama(index, formProv.namaController.text);
                              Navigator.pop(context);

                              Fluttertoast.showToast(
                                msg: 'Nama berhasil diperbarui',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                // timeInSecForIosWeb: 10,
                                backgroundColor: Colors.teal[300],
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                            FocusScope.of(context).unfocus();
                          },
                          child: const Text('Simpan')),
                    ),
                  ),
                  const Text('Harap isi dengan nama yang mudah dikenali.'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
