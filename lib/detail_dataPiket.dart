import 'package:flutter/material.dart';

class DetailDataPiket extends StatelessWidget {
  final String username;
  final String tanggal;
  final String kegiatan;
  const DetailDataPiket({
    super.key,
    required this.username,
    required this.tanggal,
    required this.kegiatan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Data Piket'),
        backgroundColor: const Color.fromARGB(255, 214, 181, 167),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: $username',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              'Tanggal: $tanggal',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              'Kegiatan: $kegiatan',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}