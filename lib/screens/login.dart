// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tim_apel/providers/account_provider.dart';
import 'package:tim_apel/providers/form_handler/login_form_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context);
    var loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 25),
              child: TextFormField(
                controller: loginFormProvider.usernameController,
                decoration: InputDecoration(
                    errorText:
                        loginFormProvider.isUsernameEmpty ? 'Username Tidak Boleh Kosong' : null,
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Username',
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: TextFormField(
                controller: loginFormProvider.passwordController,
                obscureText: !loginFormProvider.getPasswordVisible,
                decoration: InputDecoration(
                    errorText:
                        loginFormProvider.isPasswordEmpty ? 'Password Tidak Boleh Kosong' : null,
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        loginFormProvider.getPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        loginFormProvider.setPasswordVisible =
                            !loginFormProvider.getPasswordVisible;
                      },
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () async {
                      loginFormProvider.setIsUsernameEmpty =
                          loginFormProvider.usernameController.text.isEmpty;
                      loginFormProvider.setIsPasswordEmpty =
                          loginFormProvider.passwordController.text.isEmpty;

                      if (!loginFormProvider.isUsernameEmpty &&
                          !loginFormProvider.isPasswordEmpty) {
                        Map response = await accountProvider.login(
                            loginFormProvider.usernameController.text,
                            loginFormProvider.passwordController.text);
                        if (!response['status']) {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.warning,
                              confirmBtnColor: Colors.teal[700]!,
                              title: 'Login Gagal',
                              text: response['message']);
                        }
                      }

                      loginFormProvider.usernameController.clear();
                      loginFormProvider.passwordController.clear();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                      ),
                    ),
                  )),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.teal[500],
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
