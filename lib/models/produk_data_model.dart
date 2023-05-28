class Produk{
  final int id;
  final String nama;
  String ? deskripsi;
  final String ? gambar;
  final int stok;
  final int hargaJual;
  final int hargaBeli;
  final String kategori;

  Produk({
    required this.id,
    required this.nama,
    this.deskripsi = "",
    required this.gambar,
    required this.stok,
    required this.hargaJual,
    required this.hargaBeli,
    required this.kategori
  });
}
