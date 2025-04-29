import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class DataBarang extends StatefulWidget {
  const DataBarang({super.key});

  @override
  State<DataBarang> createState() => _DataBarangState();
}

class _DataBarangState extends State<DataBarang> {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController transaksiController = TextEditingController();
  final TextEditingController barangController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController hargaSatuanController = TextEditingController();

  int hargaSatuan = 0;

  List<Map<String, dynamic>> jenisTransaksi = ['Barang Masuk', 'Barang Keluar']
      .map((e) => {'value': e, 'isSelected': false}).toList();
  
  List<Map<String, dynamic>> jenisBarang = [
    {'value': 'Sayuran', 'isSelected': false, 'harga': 10000},
    {'value': 'Daging', 'isSelected': false, 'harga': 150000},
    {'value': 'Buah', 'isSelected': false, 'harga': 15000},
    {'value': 'Ikan', 'isSelected': false, 'harga': 50000},
    {'value': 'Kopi', 'isSelected': false, 'harga': 30000},
    {'value': 'Teh', 'isSelected': false, 'harga': 15000},
  ];

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
        setState(() {
          tanggalController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 214, 181, 167),
        title: const Text('Data Barang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tanggal Transaksi",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: tanggalController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today, color: Colors.blue),
                      onPressed: () => _selectDateTime(context),
                    ),
                    hintText: 'Pilih tanggal dan waktu',
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tanggal tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Jenis Transaksi",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String> (
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    hintText: 'Pilih Jenis Transaksi',
                  ),
                  value: transaksiController.text.isNotEmpty ? transaksiController.text : null,
                  items: jenisTransaksi.map((item) {
                    return DropdownMenuItem<String>(
                      value: item['value'],
                      child: Text(item['value']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      transaksiController.text = value!;
                      for (var item in jenisTransaksi) {
                        item['isSelected'] = item['value'] == value;
                      }
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jenis Transaksi Harus dipilih';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Jenis Barang",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String> (
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    hintText: 'Pilih Jenis Barang',
                  ),
                  value: barangController.text.isNotEmpty ? barangController.text : null,
                  items: jenisBarang.map((item) {
                    return DropdownMenuItem<String>(
                      value: item['value'],
                      child: Text(item['value']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      barangController.text = value!;
                      for (var item in jenisBarang) {
                        item['isSelected'] = item['value'] == value;
                        if (item['value'] == value) {
                          hargaSatuan = item['harga'];
                          hargaSatuanController.text = 'Rp. $hargaSatuan';
                        }
                      }
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jenis Barang Harus dipilih';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Jumlah Barang",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Harga Satuan",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: jumlahController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          hintText: 'Masukkan Jumlah Barang',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Jumlah tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: TextEditingController(text: 'Rp. $hargaSatuan'),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          hintText: 'Harga Satuan',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DataBarang(),
                          ),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}