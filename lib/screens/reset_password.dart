import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tim_apel/providers/account_provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController formController = TextEditingController();
  bool formIsEmpty = false;

  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 25),
            child: Text('Masukkan username Anda untuk melakukan reset password',
                style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: TextFormField(
              controller: formController,
              decoration: InputDecoration(
                  errorText: formIsEmpty ? 'Username tidak boleh kosong' : null,
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: 'Username',
                  border: const OutlineInputBorder()),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      formIsEmpty = formController.text.isEmpty ? true : false;
                    });

                    if (formController.text.isNotEmpty) {
                      var response = accountProvider.resetPassword(formController.text);

                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.warning,
                          confirmBtnColor: Colors.teal[700]!,
                          confirmBtnText: response['success'] ? 'Login Sekarang' : 'Coba Lagi',
                          title: response['success'] ? 'Password Berhasil Direset' : 'Proses Gagal',
                          text: response['message'],
                          onConfirmBtnTap: () {
                            if (response['success']) {
                              Navigator.of(context).popUntil((route) => route.isFirst);
                            } else {
                              Navigator.pop(context);
                            }
                          });
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      )),
    );
  }
}
