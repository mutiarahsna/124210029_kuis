import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kuiss/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class hal_detail extends StatelessWidget {
  final Diseases penyakit;
  final Uri _url = Uri.parse('imgUrls');
  hal_detail({super.key, required this.penyakit});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(penyakit.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
                SnackBar snackBar = SnackBar(
                  content: Text("Berhasil tambah ke favorit"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Text(penyakit.name, style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 3,
                child: Image.network(penyakit.imgUrls[1]),
              ),
              Container(child: Text(penyakit.name, style: TextStyle(
                  fontSize: 20,
              fontWeight: FontWeight.w900),),
              ),
              Container(child: Text('Nama Tumbuhan',
                style: TextStyle(
                    fontWeight: FontWeight.w900),),),
              Container(child: Text(penyakit.plantName, style: TextStyle(fontSize: 14),),
              ),
              Container(child: Text('ID Penyakit',
                style: TextStyle(
                    fontWeight: FontWeight.w900),),),
              Container(child: Text(penyakit.id as String, style: TextStyle(fontSize: 14),),
              ),
              Container(child: Text('Gejala',
              style: TextStyle(
                  fontWeight: FontWeight.w900),),),
              Container(child: Text(penyakit.symptom, style: TextStyle(fontSize: 14),),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _launchUrl('penyakit.imgUrls');
        },
        child: Icon(Icons.zoom_in),
        backgroundColor: Colors.teal,
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}