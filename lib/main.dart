import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/filter_transaksi_provider.dart';
import 'package:tim_apel/providers/form_handler/edit_nama_form_provider.dart';
import 'package:tim_apel/providers/form_handler/login_form_provider.dart';
import 'package:tim_apel/providers/form_handler/register_staf_form_provider.dart';
import 'package:tim_apel/providers/form_handler/produk_form_provider.dart';
import 'package:tim_apel/providers/image_provider.dart';
import 'package:tim_apel/providers/qty_produk_provider.dart';
import 'package:tim_apel/providers/search_laris_provider.dart';
import 'package:tim_apel/providers/stok_produk_provider.dart';
import 'package:tim_apel/providers/transaksi_provider.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/providers/bottom_navbar_provider.dart';
import 'package:tim_apel/providers/tunai_provider.dart';
import 'package:tim_apel/screens/login.dart';
import 'package:tim_apel/widgets/MainApp.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => BottomNavbarProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => AccountProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => RegisterStafFormProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProdukProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => QtyProdukProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProdukFormProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => EditNamaFormProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => TransaksiProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => FilterTransaksiProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => StokProdukProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => SearchLarisProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => TunaiProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ImgProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);

    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!);
      },
      title: 'Makmur App',
      theme: accountProvider.getTheme(),
      home: accountProvider.isLoggedIn ? const MainApp() : const Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
