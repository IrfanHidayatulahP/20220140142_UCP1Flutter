import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController konfirmasiPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Register'),
              Column(
                children: [
                  TextFormField(
                    controller: namaController,
                    decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan Masukkan Nama Lengkap Anda';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan Masukkan Email Anda';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: noTelpController,
                    decoration: const InputDecoration(labelText: 'No. HP'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan Masukkan No HP Anda';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan Masukkan Password Anda';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: konfirmasiPasswordController,
                    decoration: const InputDecoration(labelText: 'Konfirmasi Ulang Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan Masukkan Ulang Password Anda';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                        }
                      },
                    child: const Text('Login'),
                  ),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: const Text('Sudah Punya Akun? Login!')
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}