import 'package:flutter/material.dart';

class StokProdukProvider extends ChangeNotifier {
  bool _statusSegeraHabis = false;
  bool _statusHabis = false;
  // final List _stokProduk = [
  //   {
  //     'img': "assets/product_images/produk_1.jpg",
  //     'nama': 'Lem Kertas Kenko \nUk. Besar ',
  //   },
  //   {
  //     'img': "assets/product_images/produk_1.jpg",
  //     'nama': 'Lem Kertas Kenko \nUk. Besar ',
  //   },
  //   {
  //     'img': "assets/product_images/produk_1.jpg",
  //     'nama': 'Lem Kertas Kenko \nUk. Besar ',
  //   },
  //   {
  //     'img': "assets/product_images/produk_1.jpg",
  //     'nama': 'Lem Kertas Kenko \nUk. Besar ',
  //     'sisa': 2
  //   },
  //   {
  //     'img': "assets/product_images/produk_1.jpg",
  //     'nama': 'Lem Kertas Kenko \nUk. Besar ',
  //     'sisa': 2
  //   },
  // ];

  get statusSegeraHabis => _statusSegeraHabis;
  get statusHabis => _statusHabis;

  // List get getStokProduk {
  //   if (!_statusSegeraHabis && !_statusHabis) {
  //     return _stokProduk; // Return all products if no filter is selected
  //   } else if (_statusSegeraHabis && !_statusHabis) {
  //     return _stokProduk
  //         .where((product) =>
  //             product.containsKey('sisa') &&
  //             product['sisa'] != null &&
  //             product['sisa'] > 0)
  //         .toList();
  //   } else if (!_statusSegeraHabis && _statusHabis) {
  //     return _stokProduk
  //         .where((product) => !product.containsKey('sisa'))
  //         .toList();
  //   } else {
  //     return _stokProduk; // Return empty list if both filters are selected
  //   }
  // }

  set setStatusSegeraHabis(value) {
    _statusSegeraHabis = value;
    notifyListeners();
  }

  set setStatusHabis(value) {
    _statusHabis = value;
    notifyListeners();
  }
}
