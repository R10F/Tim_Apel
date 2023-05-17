import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tim_apel/Widget/BottomNavbar.dart';
import 'package:tim_apel/provider/Login_provider.dart';
import 'package:tim_apel/provider/RegistStaf_Provider.dart';
import 'package:tim_apel/provider/SharedPreferences_Provider.dart';
import 'package:tim_apel/provider/bottomNavbar_provider.dart';
import 'package:tim_apel/provider/darkMode_provider.dart';
import 'package:tim_apel/screen/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        create: (_) => SharedPreferenceProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var darkModeSwitch = Provider.of<DarkModeProvider>(context);
    var SharedPreferProvider = Provider.of<SharedPreferenceProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkModeSwitch.getTheme(),
      home: SharedPreferProvider.isLogin ? BottomNavbar() : Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
