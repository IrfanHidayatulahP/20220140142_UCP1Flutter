import 'package:flutter/material.dart';
import 'package:ucp1pam/home_page.dart';

class DetailDatapelanggan extends StatelessWidget {
  final String username;
  final String namaLengkap;
  final String email;
  final String noTelp;
  final String alamat;
  final String provinsi;
  final String kodepos;
  const DetailDatapelanggan({
    super.key,
    required this.username,
    required this.namaLengkap,
    required this.email,
    required this.noTelp,
    required this.alamat,
    required this.provinsi,
    required this.kodepos,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Data Pelanggan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 214, 181, 167),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/sb2.png'),
            ),
            const SizedBox(height: 16),
            Text(
              namaLengkap,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              noTelp,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: alamat,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                prefixIcon: Icon(Icons.home),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: provinsi,
                    decoration: const InputDecoration(
                      labelText: 'Provinsi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      prefixIcon: Icon(Icons.location_city),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    initialValue: kodepos,
                    decoration: const InputDecoration(
                      labelText: 'Kode Pos',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      prefixIcon: Icon(Icons.pin_drop),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var widget = HomePage(username: username);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => HomePage(username: widget.username)),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 214, 181, 167),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ), 
              child: 
                const Text(
                  'Selesai', 
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}