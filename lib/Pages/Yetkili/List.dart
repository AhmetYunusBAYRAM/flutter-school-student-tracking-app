import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Liste extends StatelessWidget {
  Liste({Key? key}) : super(key: key);
  List<Ogrenci> tumOgrenciler =
      List.generate(5, (index) => Ogrenci(index + 1, 'A', 'B'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: tumOgrenciler
            .map((Ogrenci ogr) => ListTile(
                  title: Text(ogr.isim),
                  subtitle: Text(ogr.numara.toString()),
                ))
            .toList(),
      ),
    );
  }
}

class Ogrenci {
  final int numara;
  final String isim;
  final String soyisim;
  Ogrenci(this.numara, this.isim, this.soyisim);
}
