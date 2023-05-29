import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/screens/admin/account/register_done.dart';
import 'package:tim_apel/providers/RegistStaf_Provider.dart';
import 'package:tim_apel/providers/auth_provider.dart';
import 'package:tim_apel/providers/darkMode_provider.dart';

class RegisterStaf extends StatefulWidget {
  const RegisterStaf({super.key});

  @override
  State<RegisterStaf> createState() => _RegisterStafState();
}

class _RegisterStafState extends State<RegisterStaf> {
  @override
  Widget build(BuildContext context) {
    var regisStafProvider = Provider.of<RegistStafProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    var darkModeSwitch = Provider.of<DarkModeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi Staf'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: regisStafProvider.namaController,
              decoration: InputDecoration(
                  errorText: regisStafProvider.isNameEmpty
                      ? 'Nama Tidak Boleh Kosong'
                      : null,
                  labelStyle: TextStyle(
                      color: darkModeSwitch.getdarkModeswitchvalue
                          ? Colors.white
                          : Colors.black),
                  labelText: 'Nama',
                  border: const OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: regisStafProvider.usernameController,
              decoration: InputDecoration(
                  errorText: regisStafProvider.isUsernameEmpty
                      ? 'Username Tidak Boleh Kosong'
                      : null,
                  labelStyle: TextStyle(
                      color: darkModeSwitch.getdarkModeswitchvalue
                          ? Colors.white
                          : Colors.black),
                  labelText: 'Username',
                  border: const OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: regisStafProvider.passwordController,
              obscureText: !regisStafProvider.getPasswordVisible,
              decoration: InputDecoration(
                  errorText: regisStafProvider.isPasswordEmpty
                      ? 'Password Tidak Boleh Kosong'
                      : null,
                  labelStyle: TextStyle(
                      color: darkModeSwitch.getdarkModeswitchvalue
                          ? Colors.white
                          : Colors.black),
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      regisStafProvider.getPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      regisStafProvider.setPasswordVisible =
                          !regisStafProvider.getPasswordVisible;
                    },
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              maxLines: 2,
              controller: regisStafProvider.jadwalController,
              decoration: InputDecoration(
                  errorText: regisStafProvider.isJadwalEmpty
                      ? 'Jadwal Tidak Boleh Kosong'
                      : null,
                  labelStyle: TextStyle(
                      color: darkModeSwitch.getdarkModeswitchvalue
                          ? Colors.white
                          : Colors.black),
                  labelText: 'Jadwal',
                  border: const OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    regisStafProvider.setIsNameEmpty =
                        regisStafProvider.namaController.text.isEmpty;
                    regisStafProvider.setIsUsernameEmpty =
                        regisStafProvider.usernameController.text.isEmpty;
                    regisStafProvider.setIsPasswordEmpty =
                        regisStafProvider.passwordController.text.isEmpty;
                    regisStafProvider.setIsJadwalEmpty =
                        regisStafProvider.jadwalController.text.isEmpty;

                    if (!regisStafProvider.isNameEmpty &&
                        !regisStafProvider.isUsernameEmpty &&
                        !regisStafProvider.isPasswordEmpty &&
                        !regisStafProvider.isJadwalEmpty) {
                      regisStafProvider.staf['nama'] =
                          regisStafProvider.namaController.text;

                      regisStafProvider.staf['username'] =
                          regisStafProvider.usernameController.text;

                      regisStafProvider.staf['password'] =
                          regisStafProvider.passwordController.text;

                      regisStafProvider.staf['jadwal'] =
                          regisStafProvider.jadwalController.text;

                      authProvider.register = regisStafProvider.staf;
                      // regisStafProvider.setListStaf = regisStafProvider.staf;

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterDone()));

                      regisStafProvider.namaController.clear();
                      regisStafProvider.usernameController.clear();
                      regisStafProvider.passwordController.clear();
                      regisStafProvider.jadwalController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[700]),
                  child: const Text('Simpan'),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
