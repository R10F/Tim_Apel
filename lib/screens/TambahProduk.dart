import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/produk_provider.dart';

class TambahProduk extends StatefulWidget {
  const TambahProduk({super.key});

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
  final _formKey = GlobalKey<FormState>();
  String kategoriSelected = "invalid";
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> kategori = [
      DropdownMenuItem(child: Text("Pilih Kategori Produk"),value: "invalid"),
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
    TextEditingController namaProdukController = TextEditingController();
    TextEditingController deskripsiController = TextEditingController();
    TextEditingController stokController = TextEditingController();
    TextEditingController hargaJualController = TextEditingController();
    TextEditingController hargaBeliController = TextEditingController();

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
                  controller: namaProdukController,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Nama Produk',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Nama Produk tidak boleh kosong";
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  controller: deskripsiController,
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
                  value: kategoriSelected,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: 'Kategori',
                    border: OutlineInputBorder()
                  ),
                  validator: (value) => (value == null || value == "invalid") ? "Pilih kategori" : null,
                  onChanged: (val){
                    setState(() {
                      kategoriSelected = val as String;
                    });
                  },
                ),
              ),
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  controller: stokController,
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
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  controller: hargaBeliController,
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
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  controller: hargaJualController,
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
                            nama = namaProdukController.text;
                            gambar = "assets/product_images/produk_2.jpg"; //temp
                            deskripsi = deskripsiController.text;
                            stok = int.parse(stokController.text); 
                            hargaJual = int.parse(hargaJualController.text);
                            hargaBeli = int.parse(hargaBeliController.text); 
                            kategori = kategoriSelected;
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
