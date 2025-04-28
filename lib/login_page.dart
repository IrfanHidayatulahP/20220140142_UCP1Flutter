import 'package:flutter/material.dart';
import 'package:ucp1pam/home_page.dart';
import 'package:ucp1pam/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 181, 167),
      appBar: AppBar(
        title: const Text('Selamat Datang Kembali'),
        backgroundColor: const Color.fromARGB(255, 214, 181, 167),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'images/sb2.png',
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            username: emailController.text,
                          )
                        )
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
                TextButton(onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()));
                }, 
                child: const Text('Belum punya akun? Daftar disini')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}