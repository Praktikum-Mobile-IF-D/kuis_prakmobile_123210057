import 'package:flutter/material.dart';
import 'package:quiz/data_buku.dart';
import 'package:quiz/detailpage.dart';
import 'package:quiz/login.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Data Buku',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final DataBuku buku = listBuku[index];
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Detailpage(buku : buku);
                }));
              },
              child: Card(
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: Image.network(buku.imageLink[0])
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(buku.title),
                            Text(buku.author),
                            Text(buku.pages),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          );
        },
      ),
    );
  }
}