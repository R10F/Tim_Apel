import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/screens/admin/account/register_done.dart';
import 'package:tim_apel/providers/form_handler/register_staf_form_provider.dart';
import 'package:tim_apel/providers/account_provider.dart';

class RegisterStaf extends StatefulWidget {
  const RegisterStaf({super.key});

  @override
  State<RegisterStaf> createState() => _RegisterStafState();
}

class _RegisterStafState extends State<RegisterStaf> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    var registerFormProvider = Provider.of<RegisterStafFormProvider>(context);

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
              controller: registerFormProvider.namaController,
              decoration: InputDecoration(
                  errorText: registerFormProvider.isNameEmpty
                      ? 'Nama Tidak Boleh Kosong'
                      : null,
                  labelStyle: TextStyle(
                      color: accountProvider.getSetting('dark_mode')
                          ? Colors.white
                          : Colors.black),
                  labelText: 'Nama',
                  border: const OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: registerFormProvider.usernameController,
              decoration: InputDecoration(
                  errorText: registerFormProvider.isUsernameEmpty
                      ? 'Username Tidak Boleh Kosong'
                      : null,
                  labelStyle: TextStyle(
                      color: accountProvider.getSetting('dark_mode')
                          ? Colors.white
                          : Colors.black),
                  labelText: 'Username',
                  border: const OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: registerFormProvider.passwordController,
              obscureText: !registerFormProvider.getPasswordVisible,
              decoration: InputDecoration(
                  errorText: registerFormProvider.isPasswordEmpty
                      ? 'Password Tidak Boleh Kosong'
                      : null,
                  labelStyle: TextStyle(
                      color: accountProvider.getSetting('dark_mode')
                          ? Colors.white
                          : Colors.black),
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      registerFormProvider.getPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      registerFormProvider.setPasswordVisible =
                          !registerFormProvider.getPasswordVisible;
                    },
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              maxLines: 2,
              controller: registerFormProvider.jadwalController,
              decoration: InputDecoration(
                  errorText: registerFormProvider.isJadwalEmpty
                      ? 'Jadwal Tidak Boleh Kosong'
                      : null,
                  labelStyle: TextStyle(
                      color: accountProvider.getSetting('dark_mode')
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
                    registerFormProvider.setIsNameEmpty =
                        registerFormProvider.namaController.text.isEmpty;
                    registerFormProvider.setIsUsernameEmpty =
                        registerFormProvider.usernameController.text.isEmpty;
                    registerFormProvider.setIsPasswordEmpty =
                        registerFormProvider.passwordController.text.isEmpty;
                    registerFormProvider.setIsJadwalEmpty =
                        registerFormProvider.jadwalController.text.isEmpty;

                    if (!registerFormProvider.isNameEmpty &&
                        !registerFormProvider.isUsernameEmpty &&
                        !registerFormProvider.isPasswordEmpty &&
                        !registerFormProvider.isJadwalEmpty) {
                      accountProvider.register = {
                        'nama': registerFormProvider.namaController.text,
                        'username':
                            registerFormProvider.usernameController.text,
                        'password':
                            registerFormProvider.passwordController.text,
                        'jadwal': registerFormProvider.jadwalController.text
                      };

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterDone()));

                      registerFormProvider.namaController.clear();
                      registerFormProvider.usernameController.clear();
                      registerFormProvider.passwordController.clear();
                      registerFormProvider.jadwalController.clear();
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
