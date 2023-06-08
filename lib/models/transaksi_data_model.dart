import 'package:tim_apel/models/produk_data_model.dart';

class Transaksi {
  int nomorAntrean;
  int idKasir;
  bool inProcess = true;
  String metodePembayaran = '';
  List<int> listIdProduk;

  Transaksi({required this.nomorAntrean, required this.idKasir, this.listIdProduk = const []});

  get keranjang {
    List<Produk> result = [];
    var produkData = ProdukData();

    for (int id in listIdProduk) {
      for (Produk produk in produkData.listProduk) {
        if (id == produk.id) {
          result.add(produk);
        }
      }
    }

    return result;
  }

  get totalBelanja => 100;
}

class TransaksiData {
  List<Transaksi> listTransaksi = [
    Transaksi(nomorAntrean: 1, idKasir: 1, listIdProduk: [1, 3, 7])
  ];
}
