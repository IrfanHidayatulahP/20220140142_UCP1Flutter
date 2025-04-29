import 'package:flutter/material.dart';

class DetailDatabarang extends StatefulWidget {
  final String tanggal;
  final String transaksi;
  final String barang;
  final String jumlah;
  final String hargaSatuan;
  final String totalHarga;

  const DetailDatabarang({
    super.key,
    required this.tanggal,
    required this.transaksi,
    required this.barang,
    required this.jumlah,
    required this.hargaSatuan,
    required this.totalHarga,
    });

  @override
  State<DetailDatabarang> createState() => _DetailDatabarangState();
}

class _DetailDatabarangState extends State<DetailDatabarang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Data Barang'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 214, 181, 167),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                child: Icon(Icons.check_circle_outline_sharp, size: 100, color: Colors.blue),
              ),
              const SizedBox(height: 16),
              Text(
                widget.tanggal,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                widget.transaksi,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                widget.barang,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                widget.jumlah,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                widget.hargaSatuan,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                widget.totalHarga,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}