import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/produk_provider.dart';
import 'package:tim_apel/widgets/MainApp.dart';
import 'package:tim_apel/providers/Login_provider.dart';
import 'package:tim_apel/providers/RegistStaf_Provider.dart';
import 'package:tim_apel/providers/SecureStorage_Provider.dart';
import 'package:tim_apel/providers/bottomNavbar_provider.dart';
import 'package:tim_apel/providers/darkMode_provider.dart';
import 'package:tim_apel/screens/Login.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => bottomNavbarProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => DarkModeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => RegistStafProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => SecureStorageProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProdukProvider(),
      )
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
    var darkModeSwitch = Provider.of<DarkModeProvider>(context);
    var SecureStorage = Provider.of<SecureStorageProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkModeSwitch.getTheme(),
      home: SecureStorage.isLoggedIn ? const MainApp() : const Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
