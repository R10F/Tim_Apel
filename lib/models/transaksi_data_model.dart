import 'package:tim_apel/models/produk_data_model.dart';

class Transaksi {
  int nomorAntrean;
  int idKasir;
  bool inProcess;
  String metodePembayaran;
  Map<int, int> listProduk; // key: idProduk, value: qty

  Transaksi({
    required this.nomorAntrean,
    required this.idKasir,
    this.inProcess = true,
    this.metodePembayaran = '',
    Map<int, int>? listProduk,
  }) : listProduk = listProduk ?? {};

  get keranjang {
    var produkData = ProdukData();

    List result = [];
    listProduk.forEach((idProduk, qty) {
      result.add({'produk': produkData.listProduk[idProduk - 1], 'qty': qty});
    });
    return result;
  }

  get itemCount {
    int count = 0;
    listProduk.forEach((idProduk, qty) {
      count += qty;
    });
    return count;
  }

  get totalHargaBelanja {
    var produkData = ProdukData();

    int harga = 0;
    listProduk.forEach((idProduk, qty) {
      harga += produkData.listProduk[idProduk - 1].hargaJual * qty;
    });
    return harga;
  }

  void addToCart(int idProduk, int qty) {
    listProduk[idProduk] = qty;
  }
}

class TransaksiData {
  List<Transaksi> listTransaksi = [
    Transaksi(nomorAntrean: 1, idKasir: 0, listProduk: {1: 3, 2: 2, 3: 5, 5: 2, 7: 1}),
    Transaksi(nomorAntrean: 3, idKasir: 2, listProduk: {
      4: 2,
      6: 4,
    }),
    Transaksi(nomorAntrean: 4, idKasir: 3, listProduk: {
      2: 1,
      5: 3,
    }),
    Transaksi(
        nomorAntrean: 2,
        idKasir: 4,
        listProduk: {
          2: 5,
          4: 4,
          6: 5,
        },
        inProcess: false,
        metodePembayaran: 'Tunai'),
  ];
}
