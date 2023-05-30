import 'package:flutter/material.dart';

class TambahProduk extends StatefulWidget {
  const TambahProduk({super.key});

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
  final _formKey = GlobalKey<FormState>();
  String kategoriSelected = "";
  List semuaKategori = [
    'ATK',
    'Craft Supply',
    'Keperluan Jahit',
    'Dekorasi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Produk'),),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Nama Produk',
                    border: const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Nama Produk tidak boleh kosong";
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Deskripsi',
                    border: const OutlineInputBorder()
                  ),
                  maxLines: null, 
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: DropdownButtonFormField(
                  items: semuaKategori.map((kategori){
                    return DropdownMenuItem(child: Text(kategori), value: kategori);
                  }).toList(),
                  value: kategoriSelected,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Kategori',
                    border: const OutlineInputBorder()
                  ),
                  hint: Text('Pilih Kategori Produk'),
                  validator: (value) {
                    if (kategoriSelected == "" || kategoriSelected.isEmpty){
                      return "Pilih salah satu kategori";
                    }
                    return null;
                  },
                  onChanged: (val){
                    setState(() {
                      kategoriSelected = val as String;
                    });
                  },
                ), 
              ),
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Jumlah Stok',
                    border: const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Jumlah Stok tidak boleh kosong";
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Harga Beli',
                    border: const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Harga Beli tidak boleh kosong";
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Harga Jual',
                    border: const OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Harga Jual tidak boleh kosong";
                    return null;
                  },
                ),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
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