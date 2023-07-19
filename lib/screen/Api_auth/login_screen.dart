// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // initilize textcontroller for email and password get
  @override
  Widget build(BuildContext context) {
    final Auth_provider = Provider.of<AuthProvider>(context); // call provider
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Login'))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,

              /// assign controller
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController, // assign contoller
              decoration: const InputDecoration(
                hintText: 'password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // button
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: Auth_provider.Loding // if loding
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Login'), //else
                onPressed: () {
                  Auth_provider.Login(
                      emailController.text.toString(),
                      passwordController.text
                          .toString()); // passing email, password for login( function are in ai=uthprovider)
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
