import 'package:flutter/material.dart';
import 'package:quiz/data_buku.dart';
import 'package:quiz/homepage.dart';
import 'package:url_launcher/url_launcher';

class Detailpage extends StatefulWidget {
  final DataBuku buku;
  const Detailpage({super.key, required this.buku});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    final buku = widget.buku;
    return Scaffold(
      appBar: AppBar(
        title: Text(buku.title),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(width: 50,),

            Container(
              height: MediaQuery.of(context).size.height *0.2,
              width: MediaQuery.of(context).size.width *0.2,
              child: Image.network(buku.imageLink),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Penulis: ", buku.author),
                Text("Bahasa: ", buku.language),
                Text("Negara: ", buku.country),
                Text("Jumlah Halaman: ", buku.pages),
                Text("Tahun Terbit: ", buku.year),
                Text("Status: ", buku.isAvailable),
              ],
            )
          ],
        ),
      ),
    );
  }
}