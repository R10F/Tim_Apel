import 'package:flutter/material.dart';
import '../models/produk_data_model.dart';

class ProdukProvider extends ChangeNotifier{
  List <String> _kategori = ["ATK", "Craft Supply", "Keperluan Jahit", "Dekorasi"];
  get kategori => _kategori;

  List <Produk> _semuaProduk = [
    Produk(
      id: 1,
      nama: "Lem Kertas Kenko Uk. Besar",
      gambar: "assets/product_images/produk_1.jpg",
      stok: 10,
      hargaJual: 10000,
      hargaBeli: 9000,
      kategori: "ATK",
    ),
    Produk(
      id: 2,
      nama: "Lem Kertas Kenko Uk. Kecil",
      gambar: "assets/product_images/produk_1.jpg",
      stok: 10,
      hargaJual: 5000,
      hargaBeli: 4000,
      kategori: "ATK",
    ),
    Produk(
      id: 3,
      nama: "Lem Lilin Uk. Kecil",
      gambar: "assets/product_images/produk_2.jpg",
      stok: 100,
      hargaJual: 1000,
      hargaBeli: 700,
      kategori: "Craft Supply"
    ),
    Produk(
      id: 4,
      nama: "Lem Lilin Uk. Besar",
      gambar: "assets/product_images/produk_2.jpg",
      stok: 80,
      hargaJual: 3000,
      hargaBeli: 2500,
      kategori: "Craft Supply"
    ),
    Produk(
      id: 5,
      nama: "Set Jarum Jahit",
      gambar: "assets/product_images/produk_3.jpg",
      stok: 10,
      hargaJual: 8000,
      hargaBeli: 7000,
      kategori: "Keperluan Jahit"
    ),
    Produk(
      id: 6,
      nama: "Meteran Kain",
      gambar: "assets/product_images/produk_4.jpg",
      stok: 10,
      hargaJual: 4000,
      hargaBeli: 3500,
      kategori: "Keperluan Jahit"
    ),
    Produk(
      id: 7,
      nama: "Pita Satin Meteran 0.5 cm Merah",
      gambar: "assets/product_images/produk_5.jpg",
      stok: 100,
      hargaJual: 500,
      hargaBeli: 400,
      kategori: "Dekorasi"
    ),    
    Produk(
      id: 8,
      nama: "Pita Satin Roll 1 cm Merah",
      gambar: "assets/product_images/produk_6.jpg",
      stok: 10,
      hargaJual: 10000,
      hargaBeli: 7000,
      kategori: "Dekorasi"
    ),
  ];

  get semuaProduk => _semuaProduk;

  getProduk(idx){
    return _semuaProduk[idx];
  }
  getProdukPerKategori(kategori){
    return semuaProduk.where((produk) => produk.kategori == kategori).toList();
  }

  set addProduk( produkBaru){
    // Produk produkBaru = Produk(  
    //   nama: nama,
    //   gambar: gambar, 
    //   deskripsi: deskripsi, 
    //   stok: stok, 
    //   hargaJual: hargaJual, 
    //   hargaBeli: hargaBeli, 
    //   kategori: kategori,
    // );
    _semuaProduk.add(produkBaru);
    notifyListeners();
  }
}

