import 'package:tim_apel/models/produk_data_model.dart';

class Transaksi {
  int nomorAntrean;
  int idKasir;
  bool inProcess;
  String metodePembayaran;
  List listProduk;

  Transaksi(
      {required this.nomorAntrean,
      required this.idKasir,
      this.inProcess = true,
      this.metodePembayaran = '',
      this.listProduk = const []});

  get keranjang {
    List<Produk> result = [];
    var produkData = ProdukData();

    for (var p in listProduk) {
      for (Produk produk in produkData.listProduk) {
        if (p['id'] == produk.id) {
          result.add(produk);
        }
      }
    }

    return result;
  }

  get totalBelanja => 100;

  void addToCart(int idProduk, int qty) {
    listProduk.add({'id': idProduk, 'qty': qty});
  }
}

class TransaksiData {
  List<Transaksi> listTransaksi = [
    Transaksi(nomorAntrean: 1, idKasir: 0, listProduk: [
      {'id': 1, 'qty': 3},
      {'id': 3, 'qty': 5},
      {'id': 7, 'qty': 1},
    ]),
    Transaksi(nomorAntrean: 3, idKasir: 2, listProduk: [
      {'id': 4, 'qty': 2},
      {'id': 6, 'qty': 4},
    ]),
    Transaksi(nomorAntrean: 4, idKasir: 3, listProduk: [
      {'id': 2, 'qty': 1},
      {'id': 5, 'qty': 3},
    ]),
    Transaksi(
        nomorAntrean: 2,
        idKasir: 4,
        listProduk: [
          {'id': 2, 'qty': 5},
          {'id': 4, 'qty': 4},
          {'id': 6, 'qty': 5},
        ],
        inProcess: false,
        metodePembayaran: 'Tunai'),
  ];
}
