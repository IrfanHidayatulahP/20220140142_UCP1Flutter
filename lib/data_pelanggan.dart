import 'package:flutter/material.dart';
import 'package:ucp1pam/detail_dataPelanggan.dart';

class DataPelanggan extends StatefulWidget {
  final String username;

  const DataPelanggan({super.key, required this.username,});

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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Nama Customer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,                  
                  ),
                ),
                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Customer',
                    prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan Masukkan Nama Lengkap Anda';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
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
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'No Hp',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: noTelpController,
                            decoration: const InputDecoration(
                              labelText: 'No Hp',
                              prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Silahkan Masukkan No Telepon Anda';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Alamat',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: alamatController,
                      decoration: const InputDecoration(
                        labelText: 'Alamat',
                        prefixIcon: Icon(Icons.home),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silahkan Masukkan Alamat Anda';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Provinsi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: provinsiController,
                            decoration:const InputDecoration(
                              labelText: 'Provinsi',
                              prefixIcon: Icon(Icons.location_city),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Silahkan Masukkan Provinsi Anda';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kode Pos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: kodeposController,
                            decoration: const InputDecoration(
                                labelText: 'Kode Pos',
                                prefixIcon: Icon(Icons.pin_drop),
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Silahkan Masukkan Kode Pos Anda';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => DetailDatapelanggan(
                            username: widget.username,
                            namaLengkap: namaController.text,
                            email: emailController.text,
                            noTelp: noTelpController.text,
                            alamat: alamatController.text,
                            provinsi: provinsiController.text,
                            kodepos: kodeposController.text,
                          ),
                        )
                      );
                    }
                  },
                  child: const Text('Simpan'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    namaController.clear();
                    emailController.clear();
                    noTelpController.clear();
                    alamatController.clear();
                    provinsiController.clear();
                    kodeposController.clear();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}