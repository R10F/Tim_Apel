import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/providers/bottom_navbar_provider.dart';
import 'package:tim_apel/screens/transaksi/dalam_proses/rincian_transaksi.dart';
import 'package:tim_apel/widgets/CustomProdukSearch.dart';
import 'package:tim_apel/widgets/TabNavigasiProduk.dart';
import 'package:tim_apel/widgets/TabNavigasiTransaksi.dart';

class AppBarOwner extends StatelessWidget {
  const AppBarOwner({super.key});

  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    var transaksiProvider = Provider.of<TransaksiProvider>(context);
    var bottomNavProvider = Provider.of<BottomNavbarProvider>(context);

    return AppBar(
        actions: [
          if (bottomNavProvider.getSelectedIdx == 1) // Search icon - Page Produk
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomProdukSearch());
                },
                icon: const Icon(Icons.search)),
          if (bottomNavProvider.getSelectedIdx == 1) // Cart icon - Page Produk
            IconButton(
                onPressed: transaksiProvider.hasTransaksiActive
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (_) => RincianTransaksi(
                                      idTransaksi: transaksiProvider.selectedAntrean,
                                      namaKasir: accountProvider
                                          .userAccounts[transaksiProvider
                                              .listTransaksi[transaksiProvider.selectedAntrean]
                                              .idKasir]
                                          .nama,
                                      transaksi: transaksiProvider
                                          .listTransaksi[transaksiProvider.selectedAntrean],
                                    )));
                      }
                    : null,
                icon: const Icon(Icons.receipt_long)),
          PopupMenuButton(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 1,
              )),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  'Antrean ${transaksiProvider.listTransaksi[transaksiProvider.selectedAntrean].nomorAntrean}'),
            ),
            onSelected: (value) {
              transaksiProvider.selectedAntrean = value;

              Fluttertoast.showToast(
                msg: 'Transaksi aktif berhasil diubah',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.teal[300],
                textColor: Colors.white,
                fontSize: 16,
              );
            },
            itemBuilder: (BuildContext context) {
              List listTransaksi = transaksiProvider.listTransaksi
                  .where((transaksi) => transaksi.inProcess == true)
                  .toList();

              return List.generate(
                  listTransaksi.length,
                  (index) => PopupMenuItem(
                      value: index,
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Antrean ${listTransaksi[index].nomorAntrean}'),
                          leading: index == transaksiProvider.selectedAntrean
                              ? const Icon(Icons.check)
                              : const SizedBox(width: 24))));
            },
          ),
        ],
        title: (bottomNavProvider.getSelectedIdx == 0)
            ? const Text(
                'Makmur App',
              )
            : (bottomNavProvider.getSelectedIdx == 1)
                ? const Text(
                    "Produk",
                  )
                : (bottomNavProvider.getSelectedIdx == 2)
                    ? const Text(
                        'Transaksi',
                      )
                    : const Text(
                        'Profile',
                      ),
        bottom: bottomNavProvider.getSelectedIdx == 1
            ? const PreferredSize(
                preferredSize: Size.fromHeight(kTextTabBarHeight), child: TabNavigasiProduk())
            : bottomNavProvider.getSelectedIdx == 2
                ? const PreferredSize(
                    preferredSize: Size.fromHeight(kTextTabBarHeight),
                    child: TabNavigasiTransaksi())
                : null);
  }
}
