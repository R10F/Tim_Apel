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
            padding: const EdgeInsets.only(top: 25, bottom: 30),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: registerFormProvider.namaController,
              decoration: InputDecoration(
                  errorText: registerFormProvider.isNameEmpty ? 'Nama Tidak Boleh Kosong' : null,
                  labelStyle: TextStyle(
                      color: accountProvider.getSetting('dark_mode') ? Colors.white : Colors.black),
                  labelText: 'Nama',
                  border: const OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: registerFormProvider.usernameController,
              decoration: InputDecoration(
                  errorText:
                      registerFormProvider.isUsernameEmpty ? 'Username Tidak Boleh Kosong' : null,
                  labelStyle: TextStyle(
                      color: accountProvider.getSetting('dark_mode') ? Colors.white : Colors.black),
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
                  errorText:
                      registerFormProvider.isPasswordEmpty ? 'Password Tidak Boleh Kosong' : null,
                  labelStyle: TextStyle(
                      color: accountProvider.getSetting('dark_mode') ? Colors.white : Colors.black),
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
          // Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          //     child: DropdownButtonFormField(
          //       value: registerFormProvider.getHari,
          //       decoration: const InputDecoration(
          //           labelStyle: TextStyle(color: Colors.black),
          //           labelText: 'Hari',
          //           border: OutlineInputBorder()),
          //       items: const [
          //         DropdownMenuItem(
          //           value: "none",
          //           child: Text("Pilih Hari"),
          //         ),
          //         DropdownMenuItem(
          //           value: "Senin",
          //           child: Text("Senin"),
          //         ),
          //         DropdownMenuItem(
          //           value: "Selasa",
          //           child: Text("Selasa"),
          //         ),
          //         DropdownMenuItem(
          //           value: "Rabu",
          //           child: Text("Rabu"),
          //         ),
          //         DropdownMenuItem(
          //           value: "Kamis",
          //           child: Text("Kamis"),
          //         ),
          //         DropdownMenuItem(
          //           value: "Jumat",
          //           child: Text("Jumat"),
          //         ),
          //         DropdownMenuItem(
          //           value: "Sabtu",
          //           child: Text("Sabtu"),
          //         ),
          //       ],
          //       onChanged: (value) {
          //         registerFormProvider.setHari = value;
          //       },
          //     )),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         "Pilih Jadwal",
          //         style: TextStyle(color: Colors.teal[500], fontSize: 15),
          //       )),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5, top: 20),
            child: Text(
              "Pilih Jadwal",
              style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
            ),
          ),

          for (var i = 0; i < registerFormProvider.getListHari.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: registerFormProvider.getCheckboxValue(i),
                  onChanged: (value) {
                    registerFormProvider.setCheckboxValue(i, value);
                  },
                ),
                Flexible(
                  child: Text(
                    registerFormProvider.getListHari[i],
                    style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      var res = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 09, minute: 00),
                          initialEntryMode: TimePickerEntryMode.inputOnly);

                      if (res != null) {
                        var hasil = res.format(context);
                        registerFormProvider.setStartTime(i, hasil);
                      }
                    },
                    child: TextField(
                      enabled: false,
                      controller: registerFormProvider.getStartTimeController(i),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Jam Mulai",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "-",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () async {
                    var res = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 15, minute: 00),
                        initialEntryMode: TimePickerEntryMode.inputOnly);

                    if (res != null) {
                      var hasil = res.format(context);
                      registerFormProvider.setEndTime(i, hasil);
                    }
                  },
                  child: TextField(
                    enabled: false,
                    controller: registerFormProvider.getEndTimeController(i),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Jam Selesai",
                    ),
                  ),
                )),
              ],
            ),

          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 80),
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

                    bool timeIsEmpty = false;
                    bool isChecked = false;

                    for (var i = 0; i < registerFormProvider.getListHari.length; i++) {
                      if (registerFormProvider.getCheckboxValue(i)) {
                        isChecked = true;
                        if (registerFormProvider.getStartTimeController(i).text.isEmpty ||
                            registerFormProvider.getEndTimeController(i).text.isEmpty) {
                          timeIsEmpty = true;
                        }
                      }
                    }

                    if (!isChecked) {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.warning,
                          text: 'Harap Memilih Jadwal');
                    } else if (timeIsEmpty) {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.warning,
                          text: 'Harap Memilih Jam Mulai & Selesai');
                    }

                    if (!registerFormProvider.isNameEmpty &&
                        !registerFormProvider.isUsernameEmpty &&
                        !registerFormProvider.isPasswordEmpty &&
                        isChecked &&
                        !timeIsEmpty) {
                      var result = accountProvider.register({
                        'nama': registerFormProvider.namaController.text,
                        'username': registerFormProvider.usernameController.text,
                        'password': registerFormProvider.passwordController.text,
                        'jadwal': registerFormProvider.getJadwal()
                      });

                      if (result['status'] != 'success') {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.warning,
                            text: result['message']);
                        return;
                      }

                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => const RegisterDone()));

                      registerFormProvider.setToDefault();
                      //registerFormProvider.setHari = "none";
                      // registerFormProvider.jadwalController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
