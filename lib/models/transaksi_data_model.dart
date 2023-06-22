import 'package:tim_apel/models/produk_data_model.dart';
import 'package:tim_apel/utilities/datetime.dart';

class Transaksi {
  int nomorAntrean;
  int idKasir;
  bool inProcess;
  String metodePembayaran;
  String date;
  String time;
  Map<int, int> listProduk; // key: idProduk, value: qty
  List<List> listProdukAkhir; // index of inner list => 0: Produk, 1: qty

  Transaksi({
    required this.nomorAntrean,
    required this.idKasir,
    this.inProcess = true,
    this.date = '',
    this.time = '',
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
    Transaksi(nomorAntrean: 4, idKasir: 0, listProduk: {1: 3, 2: 2, 3: 5, 5: 2, 7: 1}),
    Transaksi(nomorAntrean: 5, idKasir: 2, listProduk: {
      4: 2,
      6: 4,
    }),
    Transaksi(nomorAntrean: 6, idKasir: 3, listProduk: {
      2: 1,
      5: 3,
    }),
    Transaksi(
        nomorAntrean: 2,
        idKasir: 4,
        listProduk: {3: 1, 7: 4},
        listProdukAkhir: [
          [
            Produk(
                id: 3,
                nama: "Lem Lilin Uk. Kecil",
                gambar: "produk_2.jpg",
                stok: 100,
                hargaJual: 1000,
                hargaBeli: 700,
                kategori: "Craft Supply"),
            1
          ],
          [
            Produk(
                id: 7,
                nama: "Pita Satin Meteran 0.5 cm Merah",
                gambar: "produk_5.jpg",
                stok: 100,
                hargaJual: 500,
                hargaBeli: 400,
                kategori: "Dekorasi"),
            4
          ],
        ],
        date: getTodayDate(),
        time: getCurrentTime(),
        inProcess: false,
        metodePembayaran: 'Tunai'),
    Transaksi(
        nomorAntrean: 3,
        idKasir: 0,
        listProduk: {1: 2, 3: 3, 5: 4},
        listProdukAkhir: [
          [
            Produk(
              id: 1,
              nama: "Lem Kertas Kenko Uk. Besar",
              gambar: "produk_1.jpg",
              stok: 10,
              hargaJual: 10000,
              hargaBeli: 9000,
              kategori: "ATK",
            ),
            2
          ],
          [
            Produk(
                id: 3,
                nama: "Lem Lilin Uk. Kecil",
                gambar: "produk_2.jpg",
                stok: 100,
                hargaJual: 1000,
                hargaBeli: 700,
                kategori: "Craft Supply"),
            3
          ],
          [
            Produk(
                id: 5,
                nama: "Set Jarum Jahit",
                gambar: "produk_3.jpg",
                stok: 10,
                hargaJual: 8000,
                hargaBeli: 7000,
                kategori: "Keperluan Jahit"),
            4
          ],
        ],
        date: getTodayDate(),
        time: getCurrentTime(),
        inProcess: false,
        metodePembayaran: 'Tunai'),
    Transaksi(
        nomorAntrean: 1,
        idKasir: 3,
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
        date: getYesterdayDate(),
        time: getCurrentTime(),
        inProcess: false,
        metodePembayaran: 'Tunai'),
  ];
}
