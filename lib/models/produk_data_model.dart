class Produk {
  int id;
  String nama;
  String deskripsi;
  String gambar;
  int stok;
  int hargaJual;
  int hargaBeli;
  String kategori;

  Produk({
    required this.id,
    required this.nama,
    required this.gambar,
    required this.stok,
    required this.hargaJual,
    required this.hargaBeli,
    required this.kategori,
    this.deskripsi = '',
  });
}

class ProdukData {
  List<Produk> listProduk = [
    Produk(
        id: 1,
        nama: "Lem Kertas Kenko Uk. Besar",
        gambar: "produk_1.jpg",
        stok: 10,
        hargaJual: 10000,
        hargaBeli: 9000,
        kategori: "ATK",
        deskripsi:
            'Lem Kertas Kenko Uk. Besar memiliki berat 25 gram.\n\nLem ini terbuat dari formula berbasis air yang aman dan tidak beracun untuk anak-anak.\n\nLem ini cocok untuk menempelkan kertas, foto, dan bahan lainnya tanpa merusaknya'),
    Produk(
        id: 2,
        nama: "Lem Kertas Kenko Uk. Kecil",
        gambar: "produk_1.jpg",
        stok: 10,
        hargaJual: 5000,
        hargaBeli: 4000,
        kategori: "ATK",
        deskripsi:
            'Lem Kertas Kenko Uk. Kecil memiliki berat 10 gram.\n\nLem ini terbuat dari formula berbasis air yang aman dan tidak beracun untuk anak-anak.\n\nLem ini cocok untuk menempelkan kertas, foto, dan bahan lainnya tanpa merusaknya'),
    Produk(
        id: 3,
        nama: "Lem Lilin Uk. Kecil",
        gambar: "produk_2.jpg",
        stok: 100,
        hargaJual: 1000,
        hargaBeli: 700,
        kategori: "Craft Supply",
        deskripsi:
            'Lem Lilin Uk. Kecil memiliki berat 20 gram.\n\nLem lilin adalah lem serbaguna yang dapat digunakan untuk menempelkan berbagai jenis bahan, termasuk kertas, karton, kain, dan kayu. Lem ini juga tahan air, sehingga cocok digunakan untuk proyek-proyek yang akan terkena kelembapan.'),
    Produk(
        id: 4,
        nama: "Lem Lilin Uk. Besar",
        gambar: "produk_2.jpg",
        stok: 80,
        hargaJual: 3000,
        hargaBeli: 2500,
        kategori: "Craft Supply",
        deskripsi:
            'Lem Lilin Uk. Besar memiliki berat 50 gram.\n\nLem lilin adalah lem serbaguna yang dapat digunakan untuk menempelkan berbagai jenis bahan, termasuk kertas, karton, kain, dan kayu. Lem ini juga tahan air, sehingga cocok digunakan untuk proyek-proyek yang akan terkena kelembapan.'),
    Produk(
        id: 5,
        nama: "Set Jarum Jahit",
        gambar: "produk_3.jpg",
        stok: 10,
        hargaJual: 8000,
        hargaBeli: 7000,
        kategori: "Keperluan Jahit"),
    Produk(
        id: 6,
        nama: "Meteran Kain",
        gambar: "produk_4.jpg",
        stok: 0,
        hargaJual: 4000,
        hargaBeli: 3500,
        kategori: "Keperluan Jahit"),
    Produk(
        id: 7,
        nama: "Pita Satin Meteran 0.5 cm Merah",
        gambar: "produk_5.jpg",
        stok: 100,
        hargaJual: 500,
        hargaBeli: 400,
        kategori: "Dekorasi"),
    Produk(
        id: 8,
        nama: "Pita Satin Roll 1 cm Merah",
        gambar: "produk_6.jpg",
        stok: 3,
        hargaJual: 10000,
        hargaBeli: 7000,
        kategori: "Dekorasi"),
  ];

  List<String> kategori = ["ATK", "Craft Supply", "Keperluan Jahit", "Dekorasi"];
}
