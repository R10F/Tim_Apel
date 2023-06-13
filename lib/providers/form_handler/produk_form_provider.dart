import 'package:flutter/material.dart';

class ProdukFormProvider extends ChangeNotifier {
  TextEditingController namaProdukController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController hargaJualController = TextEditingController();
  TextEditingController hargaBeliController = TextEditingController();

  int _editIdx = 0;
  get editIdx => _editIdx;
  set updateEditIdx(int newIdx){
    _editIdx = newIdx;
  }
  

  bool _edited = true;
  get edited => _edited;
  set isEdited(val){
    _edited = _edited || val;
  }

  String kategoriSelected = "none";
  get getKategoriSelected => kategoriSelected;

  set updateKategori(String kategori) {
    kategoriSelected = kategori;
  }

  // String? nama;
  // void updateNama() {
  //   nama = namaProdukController.text;
  //   print(nama);
  // }

  get getNama => namaProdukController.text;

  // String? deskripsi;
  // void updateDeskripsi() {
  //   deskripsi = deskripsiController.text;
  // }

  get getDeskripsi => deskripsiController.text;

  // String? stok;
  // void updateStok() {
  //   stok = stokController.text;
  // }

  get getStok => stokController.text;

  // String? hargaJual;
  // void updateHargaJual() {
  //   hargaJual = hargaJualController.text;
  // }

  get getHargaJual => hargaJualController.text;

  // String? hargaBeli;
  // void updateHargaBeli() {
  //   hargaBeli = hargaBeliController.text;
  // }

  get getHargaBeli => hargaBeliController.text;

  // void submitted() {
  //   nama = null;
  //   deskripsi = null;
  //   stok = null;
  //   hargaJual = null;
  //   hargaBeli = null;
  //   kategoriSelected = "none";
  // }
}
