class Produk {
  int id;
  String nama;
  String deskripsi;
  String gambar;
  int stok;
  int hargaJual;
  int hargaBeli;
  String kategori;
  bool isDeleted = false;

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
        gambar: "assets/product_images/produk_1.jpg",
        stok: 10,
        hargaJual: 10000,
        hargaBeli: 9000,
        kategori: "ATK",
        deskripsi:
            'Lem Kertas Kenko Uk. Besar memiliki berat 25 gram.\n\nLem ini terbuat dari formula berbasis air yang aman dan tidak beracun untuk anak-anak.\n\nLem ini cocok untuk menempelkan kertas, foto, dan bahan lainnya tanpa merusaknya'),
    Produk(
        id: 2,
        nama: "Lem Kertas Kenko Uk. Kecil",
        gambar: "assets/product_images/produk_1.jpg",
        stok: 10,
        hargaJual: 5000,
        hargaBeli: 4000,
        kategori: "ATK",
        deskripsi:
            'Lem Kertas Kenko Uk. Kecil memiliki berat 10 gram.\n\nLem ini terbuat dari formula berbasis air yang aman dan tidak beracun untuk anak-anak.\n\nLem ini cocok untuk menempelkan kertas, foto, dan bahan lainnya tanpa merusaknya'),
    Produk(
        id: 3,
        nama: "Lem Lilin Uk. Kecil",
        gambar: "assets/product_images/produk_2.jpg",
        stok: 100,
        hargaJual: 1000,
        hargaBeli: 700,
        kategori: "Craft Supply",
        deskripsi:
            'Lem Lilin Uk. Kecil memiliki berat 20 gram.\n\nLem lilin adalah lem serbaguna yang dapat digunakan untuk menempelkan berbagai jenis bahan, termasuk kertas, karton, kain, dan kayu. Lem ini juga tahan air, sehingga cocok digunakan untuk proyek-proyek yang akan terkena kelembapan.'),
    Produk(
        id: 4,
        nama: "Lem Lilin Uk. Besar",
        gambar: "assets/product_images/produk_2.jpg",
        stok: 80,
        hargaJual: 3000,
        hargaBeli: 2500,
        kategori: "Craft Supply",
        deskripsi:
            'Lem Lilin Uk. Besar memiliki berat 50 gram.\n\nLem lilin adalah lem serbaguna yang dapat digunakan untuk menempelkan berbagai jenis bahan, termasuk kertas, karton, kain, dan kayu. Lem ini juga tahan air, sehingga cocok digunakan untuk proyek-proyek yang akan terkena kelembapan.'),
    Produk(
        id: 5,
        nama: "Set Jarum Jahit",
        gambar: "assets/product_images/produk_3.jpg",
        stok: 10,
        hargaJual: 8000,
        hargaBeli: 7000,
        kategori: "Keperluan Jahit"),
    Produk(
        id: 6,
        nama: "Meteran Kain",
        gambar: "assets/product_images/produk_4.jpg",
        stok: 0,
        hargaJual: 4000,
        hargaBeli: 3500,
        kategori: "Keperluan Jahit"),
    Produk(
        id: 7,
        nama: "Pita Satin Meteran 0.5 cm Merah",
        gambar: "assets/product_images/produk_5.jpg",
        stok: 100,
        hargaJual: 500,
        hargaBeli: 400,
        kategori: "Dekorasi"),
    Produk(
        id: 8,
        nama: "Pita Satin Roll 1 cm Merah",
        gambar: "assets/product_images/produk_6.jpg",
        stok: 3,
        hargaJual: 10000,
        hargaBeli: 7000,
        kategori: "Dekorasi"),
    Produk(
        id: 9,
        nama: "Pulpen Biru",
        gambar: "assets/product_images/produk_7.jpg",
        stok: 50,
        hargaJual: 2000,
        hargaBeli: 1500,
        kategori: "ATK"),
    Produk(
        id: 10,
        nama: "Pulpen Hitam",
        gambar: "assets/product_images/produk_8.jpg",
        stok: 50,
        hargaJual: 2000,
        hargaBeli: 1500,
        kategori: "ATK"),
    Produk(
        id: 11,
        nama: "Gunting",
        gambar: "assets/product_images/produk_9.jpg",
        stok: 30,
        hargaJual: 5000,
        hargaBeli: 4500,
        kategori: "ATK"),
    Produk(
        id: 12,
        nama: "Push Pin",
        gambar: "assets/product_images/produk_10.jpg",
        stok: 10,
        hargaJual: 5000,
        hargaBeli: 4500,
        kategori: "ATK"),
    Produk(
        id: 13,
        nama: "Jarum Pentol",
        gambar: "assets/product_images/produk_11.jpg",
        stok: 50,
        hargaJual: 8000,
        hargaBeli: 7000,
        kategori: "Keperluan Jahit"),
    Produk(
        id: 14,
        nama: "Jarum Pentol Mini",
        gambar: "assets/product_images/produk_12.jpg",
        stok: 20,
        hargaJual: 4000,
        hargaBeli: 3500,
        kategori: "Keperluan Jahit"),
    Produk(
        id: 15,
        nama: "Benang Putih",
        gambar: "assets/product_images/produk_13.jpg",
        stok: 50,
        hargaJual: 2500,
        hargaBeli: 2000,
        kategori: "Keperluan Jahit"),
    Produk(
        id: 16,
        nama: "Benang Hitam",
        gambar: "assets/product_images/produk_14.jpg",
        stok: 50,
        hargaJual: 2500,
        hargaBeli: 2000,
        kategori: "Keperluan Jahit"),
    Produk(
        id: 17,
        nama: "Wantex Pewarna Pakaian",
        gambar: "assets/product_images/produk_15.jpg",
        stok: 40,
        hargaJual: 2000,
        hargaBeli: 1500,
        kategori: "Craft Supply"),
    Produk(
        id: 18,
        nama: "Gantungan Kunci Satuan",
        gambar: "assets/product_images/produk_16.jpg",
        stok: 100,
        hargaJual: 500,
        hargaBeli: 250,
        kategori: "Craft Supply"),
    Produk(
        id: 19,
        nama: "Gantungan Kunci per Bungkus",
        gambar: "assets/product_images/produk_17.jpg",
        stok: 5,
        hargaJual: 20000,
        hargaBeli: 15000,
        kategori: "Craft Supply"),
    Produk(
        id: 20,
        nama: "Stik Es",
        gambar: "assets/product_images/produk_18.jpg",
        stok: 40,
        hargaJual: 3000,
        hargaBeli: 2500,
        kategori: "Craft Supply"),
  ];

  List<String> kategori = ["ATK", "Craft Supply", "Keperluan Jahit", "Dekorasi"];
}
