import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tim_apel/models/produk_data_model.dart';

class ProdukProvider extends ChangeNotifier {
  var produkData = ProdukData();

  late List<Produk> _semuaProduk;
  late List<String> _kategori;

  ProdukProvider() {
    _semuaProduk = produkData.listProduk;
    _kategori = produkData.kategori;
  }

  get semuaProduk => _semuaProduk;
  get kategori => _kategori;

  getProduk(idx) {
    return _semuaProduk[idx];
  }

  getProdukById(id) {
    return semuaProduk.where((produk) => produk.id == id).toList()[0];
  }

  getProdukPerKategori(kategori) {
    return semuaProduk.where((produk) => produk.kategori == kategori).toList();
  }

  addProduk(nama, gambar, deskripsi, kategori, stok, hargaJual, hargaBeli) {
    int id = semuaProduk.length + 1;
    Produk produkBaru = Produk(
      id: id,
      nama: nama,
      gambar: gambar,
      deskripsi: deskripsi,
      stok: stok,
      hargaJual: hargaJual,
      hargaBeli: hargaBeli,
      kategori: kategori,
    );
    _semuaProduk.add(produkBaru);
    notifyListeners();
  }

  updateProduk(
      id, nama, gambar, deskripsi, kategori, stok, hargaJual, hargaBeli) {
    Produk edited = Produk(
      id: id,
      nama: nama,
      gambar: gambar,
      deskripsi: deskripsi,
      stok: stok,
      hargaJual: hargaJual,
      hargaBeli: hargaBeli,
      kategori: kategori,
    );
    _semuaProduk[id - 1] = edited;
    notifyListeners();
  }

  List<Produk> getProdukHampirHabis() {
    return semuaProduk
        .where((produk) => produk.stok <= 5 && produk.stok != 0)
        .toList();
  }

  List<Produk> getProdukHabis() {
    return semuaProduk.where((produk) => produk.stok == 0).toList();
  }

  void hapusProduk(int idProduk) {
    semuaProduk[idProduk - 1].isDeleted = true;
    notifyListeners();
  }

  Future<File> getImageFileFromAssets(String assetPath) async {
    // Load the asset image file
    ByteData byteData = await rootBundle.load(assetPath);
    List<int> imageData = byteData.buffer.asUint8List();

    // Get the temporary directory to store the image file
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    // Create a temporary file path
    String tempFileName = assetPath.split('/').last;
    String tempFilePath = '$tempPath/$tempFileName';

    // Write the image data to the temporary file
    File tempFile = File(tempFilePath);
    await tempFile.writeAsBytes(imageData);

    return tempFile;
  }
}
