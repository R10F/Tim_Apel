import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/form_handler/produk_form_provider.dart';
import 'package:tim_apel/providers/produk_provider.dart';

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
    var accountProv = Provider.of<AccountProvider>(context);
    var toBeEdited = produkProv.getProduk(widget.idxProduk - 1);

    // void _clearController() {
    //   formProv.namaProdukController.clear();
    //   formProv.deskripsiController.clear();
    //   formProv.hargaJualController.clear();
    //   formProv.stokController.clear();
    //   formProv.hargaBeliController.clear();
    //   formProv.updateKategori = "none";
    // }

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                formProv.clearController();
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
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 35, bottom: 15),
                child: TextFormField(
                  controller: formProv.namaProdukController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: accountProv.getSetting('dark_mode')
                              ? Colors.white
                              : Colors.black),
                      labelText: 'Nama Produk',
                      border: const OutlineInputBorder()),
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
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: accountProv.getSetting('dark_mode')
                              ? Colors.white
                              : Colors.black),
                      labelText: 'Deskripsi',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: const OutlineInputBorder()),
                  maxLines: null,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: DropdownButtonFormField(
                  items: dropdownItems,
                  value: formProv.getKategoriSelected,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: accountProv.getSetting('dark_mode')
                              ? Colors.white
                              : Colors.black),
                      labelText: 'Kategori',
                      border: const OutlineInputBorder()),
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
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: accountProv.getSetting('dark_mode')
                              ? Colors.white
                              : Colors.black),
                      labelText: 'Jumlah Stok',
                      border: const OutlineInputBorder()),
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                    CurrencyTextInputFormatter(
                        locale: "id", symbol: "Rp", decimalDigits: 0)
                  ],
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: accountProv.getSetting('dark_mode')
                              ? Colors.white
                              : Colors.black),
                      labelText: 'Harga Beli',
                      border: const OutlineInputBorder()),
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                    CurrencyTextInputFormatter(
                        locale: "id", symbol: "Rp", decimalDigits: 0)
                  ],
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: accountProv.getSetting('dark_mode')
                              ? Colors.white
                              : Colors.black),
                      labelText: 'Harga Jual',
                      border: const OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Harga Jual tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 25, bottom: 50),
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
                              gambar = "produk_2.jpg"; //temp
                              deskripsi = formProv.getDeskripsi;
                              stok = int.parse(formProv.getStok);
                              hargaJual = int.parse(formProv.getHargaJual
                                  .replaceAll(RegExp(r'[^0-9]'), ''));
                              hargaBeli = int.parse(formProv.getHargaBeli
                                  .replaceAll(RegExp(r'[^0-9]'), ''));
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

                              Fluttertoast.showToast(
                                msg: 'Produk Berhasil Diedit',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                backgroundColor: Colors.teal[300],
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              formProv.clearController();
                            }
                          } else {
                            null;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[700]),
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontSize,
                          ),
                        ),
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
