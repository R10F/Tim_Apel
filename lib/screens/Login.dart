import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_apel/providers/Login_provider.dart';
import 'package:tim_apel/providers/SecureStorage_Provider.dart';

import '../providers/auth_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);

    var storageProvider = Provider.of<SecureStorageProvider>(context);

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 75),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 25),
            child: TextFormField(
              controller: loginProvider.usernameController,
              decoration: InputDecoration(
                  errorText: loginProvider.isUsernameEmpty
                      ? 'Username Tidak Boleh Kosong'
                      : null,
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: 'Username',
                  border: const OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: loginProvider.passwordController,
              obscureText: !loginProvider.getPasswordVisible,
              decoration: InputDecoration(
                  errorText: loginProvider.isPasswordEmpty
                      ? 'Password Tidak Boleh Kosong'
                      : null,
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      loginProvider.getPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      loginProvider.setPasswordVisible =
                          !loginProvider.getPasswordVisible;
                    },
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () async {
                    loginProvider.setIsUsernameEmpty =
                        loginProvider.usernameController.text.isEmpty;
                    loginProvider.setIsPasswordEmpty =
                        loginProvider.passwordController.text.isEmpty;

                    if (!loginProvider.isUsernameEmpty &&
                        !loginProvider.isPasswordEmpty) {
                      if (authProvider.login(
                          loginProvider.usernameController.text,
                          loginProvider.passwordController.text)) {
                        storageProvider.setLoggedInStatus(true, 'Owner');
                      } else if (loginProvider.usernameController.text
                          .contains('staf')) {
                        storageProvider.setLoggedInStatus(true, 'Staf');
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Username atau Password Anda Salah '),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }

                    loginProvider.usernameController.clear();
                    loginProvider.passwordController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[700]),
                  child: const Text('Log In'),
                )),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Reset Password',
              style: TextStyle(color: Colors.teal[500]),
            ),
          )
        ],
      ),
    );
  }
}
