import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../providers/form_handler/produk_form_provider.dart';
import '../providers/produk_provider.dart';

class TambahProduk extends StatefulWidget {
  const TambahProduk({super.key});

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
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
                            produkProv.addProduk(nama, gambar, deskripsi,
                                kategori, stok, hargaJual, hargaBeli);

                            Navigator.pop(context);
                            Fluttertoast.showToast(
                              msg: 'Produk Berhasil Ditambahkan',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              // timeInSecForIosWeb: 10,
                              backgroundColor: Colors.teal[300],
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            formProv.namaProdukController.clear();
                            formProv.deskripsiController.clear();
                            formProv.hargaJualController.clear();
                            formProv.stokController.clear();
                            formProv.hargaBeliController.clear();
                            formProv.updateKategori = "none";
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[700]),
                        child: const Text('Tambah'),
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
