import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
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
              child: DropdownButtonFormField(
                value: registerFormProvider.getHari,
                decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: 'Hari',
                    border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(
                    value: "none",
                    child: Text("Pilih Hari"),
                  ),
                  DropdownMenuItem(
                    value: "Senin",
                    child: Text("Senin"),
                  ),
                  DropdownMenuItem(
                    value: "Selasa",
                    child: Text("Selasa"),
                  ),
                  DropdownMenuItem(
                    value: "Rabu",
                    child: Text("Rabu"),
                  ),
                  DropdownMenuItem(
                    value: "Kamis",
                    child: Text("Kamis"),
                  ),
                  DropdownMenuItem(
                    value: "Jumat",
                    child: Text("Jumat"),
                  ),
                  DropdownMenuItem(
                    value: "Sabtu",
                    child: Text("Sabtu"),
                  ),
                ],
                onChanged: (value) {
                  registerFormProvider.setHari = value;
                },
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Pilih Jam",
                  style: TextStyle(color: Colors.teal[500], fontSize: 15),
                )),
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
                    // registerFormProvider.setIsJadwalEmpty =
                    //     registerFormProvider.jadwalController.text.isEmpty;

                    if (!registerFormProvider.isNameEmpty &&
                        !registerFormProvider.isUsernameEmpty &&
                        !registerFormProvider.isPasswordEmpty) {
                      var result = accountProvider.register({
                        'nama': registerFormProvider.namaController.text,
                        'username':
                            registerFormProvider.usernameController.text,
                        'password':
                            registerFormProvider.passwordController.text,
                        'jadwal': registerFormProvider.getHari
                      });

                      if (result['status'] != 'success') {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.warning,
                            text: result['message']);
                        print(result['message']);
                        return;
                      }

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterDone()));

                      registerFormProvider.namaController.clear();
                      registerFormProvider.usernameController.clear();
                      registerFormProvider.passwordController.clear();
                      registerFormProvider.setHari = "none";
                      // registerFormProvider.jadwalController.clear();
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
