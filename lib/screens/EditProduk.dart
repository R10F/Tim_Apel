// import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../providers/form_handler/produk_form_provider.dart';
import '../providers/produk_provider.dart';

class EditProduk extends StatefulWidget {
  final int idxProduk;
  const EditProduk({super.key, required this.idxProduk});

  @override
  State<EditProduk> createState() => _EditProdukState();
}

class _EditProdukState extends State<EditProduk> {
  final _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> kategori = [
      const DropdownMenuItem(
          value: "none", child: Text("Pilih Kategori Produk")),
      const DropdownMenuItem(value: "ATK", child: Text("ATK")),
      const DropdownMenuItem(
          value: "Craft Supply", child: Text("Craft Supply")),
      const DropdownMenuItem(
          value: "Keperluan Jahit", child: Text("Keperluan Jahit")),
      const DropdownMenuItem(value: "Dekorasi", child: Text("Dekorasi")),
    ];
    return kategori;
  }

  List semuaKategori = [
    'ATK',
    'Craft Supply',
    'Keperluan Jahit',
    'Dekorasi',
  ];

  @override
  Widget build(BuildContext context) {
    var produkProv = Provider.of<ProdukProvider>(context);
    var formProv = Provider.of<ProdukFormProvider>(context);
    var toBeEdited = produkProv.getProduk(widget.idxProduk - 1);

    void _clearController() {
      formProv.namaProdukController.clear();
      formProv.deskripsiController.clear();
      formProv.hargaJualController.clear();
      formProv.stokController.clear();
      formProv.hargaBeliController.clear();
      formProv.updateKategori = "none";
    }

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                _clearController();
                Navigator.pop(context);
              },
            );
          },
        ),
        title: const Text('Edit Produk'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  controller: formProv.namaProdukController,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Nama Produk',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama Produk tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  controller: formProv.deskripsiController,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Deskripsi',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder()),
                  maxLines: null,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: DropdownButtonFormField(
                  items: dropdownItems,
                  value: formProv.getKategoriSelected,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Kategori',
                      border: OutlineInputBorder()),
                  validator: (value) => (value == null || value == "none")
                      ? "Pilih kategori"
                      : null,
                  onChanged: (val) {
                    formProv.kategoriSelected = val as String;
                  },
                ),
              ),
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  controller: formProv.stokController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Jumlah Stok',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah Stok tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  controller: formProv.hargaBeliController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Harga Beli',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Harga Beli tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  controller: formProv.hargaJualController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Harga Jual',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Harga Jual tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (formProv.edited) {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              String nama, gambar, deskripsi, kategori;
                              int stok, hargaJual, hargaBeli;

                              nama = formProv.getNama;
                              gambar =
                                  "assets/product_images/produk_2.jpg"; //temp
                              deskripsi = formProv.getDeskripsi;
                              stok = int.parse(formProv.getStok);
                              hargaJual = int.parse(formProv.getHargaJual);
                              hargaBeli = int.parse(formProv.getHargaBeli);
                              kategori = formProv.kategoriSelected;
                              produkProv.updateProduk(
                                  toBeEdited.id,
                                  nama,
                                  gambar,
                                  deskripsi,
                                  kategori,
                                  stok,
                                  hargaJual,
                                  hargaBeli);

                              Navigator.pop(context);
                              // CherryToast.info(
                              //         animationDuration:
                              //             const Duration(milliseconds: 500),
                              //         autoDismiss: true,
                              //         title: const Text("Produk Berhasil Diedit"))
                              //     .show(context);
                              Fluttertoast.showToast(
                                msg: 'Produk Berhasil Diedit',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                // timeInSecForIosWeb: 10,
                                backgroundColor: Colors.teal[300],
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              _clearController();
                            }
                          } else {
                            null;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[700]),
                        child: const Text('Simpan'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
