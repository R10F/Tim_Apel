import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/Widget/MainApp.dart';
import 'package:tim_apel/provider/Login_provider.dart';
import 'package:tim_apel/provider/RegistStaf_Provider.dart';
import 'package:tim_apel/provider/SecureStorage_Provider.dart';
import 'package:tim_apel/provider/bottomNavbar_provider.dart';
import 'package:tim_apel/provider/darkMode_provider.dart';
import 'package:tim_apel/screen/Login.dart';

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
