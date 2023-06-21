import 'package:tim_apel/models/produk_data_model.dart';

class Transaksi {
  int nomorAntrean;
  int idKasir;
  bool inProcess;
  String metodePembayaran;
  String datetime;
  Map<int, int> listProduk; // key: idProduk, value: qty
  List<List> listProdukAkhir; // index of inner list => 0: Produk, 1: qty

  Transaksi({
    required this.nomorAntrean,
    required this.idKasir,
    this.inProcess = true,
    this.datetime = '',
    this.metodePembayaran = '',
    List<List>? listProdukAkhir,
    Map<int, int>? listProduk,
  })  : listProduk = listProduk ?? {},
        listProdukAkhir = listProdukAkhir ?? [];

  get itemCount {
    int count = 0;
    listProduk.forEach((idProduk, qty) {
      count += qty;
    });
    return count;
  }

  List keranjang(List produkData) {
    List result = [];
    listProduk.forEach((idProduk, qty) {
      result.add({'produk': produkData[idProduk - 1], 'qty': qty});
    });
    return result;
  }

  int totalHargaBelanja(List produkData) {
    int harga = 0;
    listProduk.forEach((idProduk, qty) {
      int temp = produkData[idProduk - 1].hargaJual;
      harga += temp * qty;
    });
    return harga;
  }

  int totalHargaBelanjaAkhir() {
    int totalBelanja = 0;
    for (int i = 0; i < listProdukAkhir.length; i++) {
      int temp = listProdukAkhir[i][0].hargaJual * listProdukAkhir[i][1];
      totalBelanja += temp;
    }
    return totalBelanja;
  }

  void addToCart(int idProduk, int qty) {
    listProduk[idProduk] = qty;
  }

  void cancelCartItem(int idProduk) {
    listProduk.remove(idProduk);
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
        listProduk: {2: 5, 4: 4, 6: 3},
        listProdukAkhir: [
          [
            Produk(
              id: 2,
              nama: "Lem Kertas Kenko Uk. Kecil",
              gambar: "produk_1.jpg",
              stok: 10,
              hargaJual: 5000,
              hargaBeli: 4000,
              kategori: "ATK",
            ),
            5
          ],
          [
            Produk(
                id: 4,
                nama: "Lem Lilin Uk. Besar",
                gambar: "produk_2.jpg",
                stok: 80,
                hargaJual: 3000,
                hargaBeli: 2500,
                kategori: "Craft Supply"),
            4
          ],
          [
            Produk(
                id: 6,
                nama: "Meteran Kain",
                gambar: "produk_4.jpg",
                stok: 10,
                hargaJual: 4000,
                hargaBeli: 3500,
                kategori: "Keperluan Jahit"),
            3
          ],
        ],
        datetime: '20-06-2023 10:30',
        inProcess: false,
        metodePembayaran: 'Tunai'),
  ];
}
