import 'package:flutter/material.dart';
import 'package:quiz/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class Detailpage extends StatefulWidget {
  final DataBuku buku;
  const Detailpage({super.key, required this.buku});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    final buku = widget.buku;
    return Scaffold(
      appBar: AppBar(
        title: Text(buku.title),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context,index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      buku.imageLink,
                      fit: BoxFit.cover,
                    ),
                  );
                },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Penulis: ${buku.author}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Bahasa: ${buku.language}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Negara: ${buku.country}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Jumlah Halaman: ${buku.pages}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Tahun Terbit: ${buku.year}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Status: ${buku.isAvailable ? 'Tersedia' : 'Tidak Tersedia'}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    SnackBar snackbar = SnackBar(
                        content: Text("Berhasil Meminjam Buku"),
                        backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  child: Text("Pinjam"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}