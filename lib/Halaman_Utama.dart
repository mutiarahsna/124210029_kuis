import 'package:flutter/material.dart';
import 'package:kuiss/disease_data.dart';
import 'package:kuiss/Halaman_Detail.dart';

class Halaman_utama extends StatelessWidget {
  const Halaman_utama({super.key});
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Halaman Utama'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: listDisease.length,
          itemBuilder: (context, index) {
            final Diseases penyakit = listDisease[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => hal_detail(penyakit: penyakit),));
              },
              child: Card(
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Image.network(
                            penyakit.imgUrls,
                            fit: BoxFit.fill,
                          )
                      ),
                      SizedBox(width: 20,),
                      Text(penyakit.name),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
