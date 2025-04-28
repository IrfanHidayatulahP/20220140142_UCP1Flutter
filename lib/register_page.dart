import 'package:flutter/material.dart';
import 'package:ucp1pam/home_page.dart';

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
      backgroundColor: const Color.fromARGB(255, 214, 181, 167),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset('images/sb2.png'),
              const SizedBox(height: 10),
              const Text('Daftar Akun Baru',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silahkan Masukkan Email Anda';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: noTelpController,
                          decoration: const InputDecoration(
                            labelText: 'No. Hp',
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silahkan Masukkan No HP Anda';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silahkan Masukkan Password Anda';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          obscureText: true,
                          controller: konfirmasiPasswordController,
                          decoration: const InputDecoration(
                            labelText: 'Konfirmasi Password',
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silahkan Masukkan Konfirmasi Password Anda';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
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
                    child: const Text('Register'),
                  ),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: const Text(
                    'Sudah Punya Akun? Login!',
                    style: TextStyle(color: Colors.red),)
                  ),
                ],
              ),
          ),
        ),
      );
  }
}