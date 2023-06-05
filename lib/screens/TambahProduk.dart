import 'package:flutter/material.dart';
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
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> kategori = [
      DropdownMenuItem(child: Text("Pilih Kategori Produk"),value: "none"),
      DropdownMenuItem(child: Text("ATK"),value: "ATK"),
      DropdownMenuItem(child: Text("Craft Supply"),value: "Craft Supply"),
      DropdownMenuItem(child: Text("Keperluan Jahit"),value: "Keperluan Jahit"),
      DropdownMenuItem(child: Text("Dekorasi"),value: "Dekorasi"),
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
                    if (value == null || value.isEmpty)
                      return "Nama Produk tidak boleh kosong";
                    return null;
                  },
                  onEditingComplete: formProv.updateNama,
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
                  onEditingComplete: formProv.updateDeskripsi,
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
                    border: OutlineInputBorder()
                  ),
                  validator: (value) => (value == null || value == "none") ? "Pilih kategori" : null,
                  onChanged: (val){
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
                    if (value == null || value.isEmpty)
                      return "Jumlah Stok tidak boleh kosong";
                    return null;
                  },
                  onEditingComplete: formProv.updateStok,
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
                    if (value == null || value.isEmpty)
                      return "Harga Beli tidak boleh kosong";
                    return null;
                  },
                  onEditingComplete: formProv.updateHargaBeli,
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
                    if (value == null || value.isEmpty)
                      return "Harga Jual tidak boleh kosong";
                    return null;
                  },
                  onEditingComplete: formProv.updateHargaJual,
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
                            gambar = "assets/product_images/produk_2.jpg"; //temp
                            deskripsi = formProv.getDeskripsi;
                            stok = int.parse(formProv.getStok); 
                            hargaJual = int.parse(formProv.getHargaJual);
                            hargaBeli = int.parse(formProv.getHargaBeli);
                            kategori = formProv.kategoriSelected;
                            produkProv.addProduk(nama, gambar, deskripsi, kategori, stok, hargaJual, hargaBeli);

                            Navigator.pop(context); 
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