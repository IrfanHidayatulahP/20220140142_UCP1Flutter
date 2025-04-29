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
  final TextStyle labelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500
  );
  final TextStyle valueStyle = const TextStyle(
    fontSize: 16,
  );

  Widget buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: labelStyle),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }

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
              const SizedBox(height: 20),
              const Text(
                'Data Berhasil Disimpan',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const Divider(thickness: 1),
              buildDataRow(
                "Tanggal",
                widget.tanggal,
              ),
              const Divider(thickness: 1),
              buildDataRow(
                "Jenis Transaksi",
                widget.transaksi
              ),
              const Divider(thickness: 1),
              buildDataRow(
                "Jenis Barang",
                widget.barang
              ),
              const Divider(thickness: 1),
              buildDataRow(
                "Jumlah Barang",
                widget.jumlah
              ),
              const Divider(thickness: 1),
              buildDataRow(
                "Jenis Harga Satuan",
                widget.hargaSatuan
              ),
              const Divider(thickness: 1),
              buildDataRow(
                "Total Harga",
                widget.totalHarga
              ),
              const Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 214, 181, 167),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('Selesai', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}