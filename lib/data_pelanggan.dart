import 'package:flutter/material.dart';

class DataPelanggan extends StatefulWidget {
  const DataPelanggan({super.key});

  @override
  State<DataPelanggan> createState() => _DataPelangganState();
}

class _DataPelangganState extends State<DataPelanggan> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodeposController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Data Pelanggan'),
        backgroundColor: const Color.fromARGB(255, 214, 181, 167),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                TextFormField(
                  controller: noTelpController,
                  decoration: const InputDecoration(labelText: 'No Telepon'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan Masukkan No Telepon Anda';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: alamatController,
                  decoration: const InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan Masukkan Alamat Anda';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: provinsiController,
                  decoration:
                      const InputDecoration(labelText: 'Provinsi'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan Masukkan Provinsi Anda';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: kodeposController,
                  decoration:
                      const InputDecoration(labelText: 'Kode Pos'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan Masukkan Kode Pos Anda';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Pelanggan Disimpan')),
                      );
                    }
                  },
                  child: const Text('Simpan'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Reset'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}