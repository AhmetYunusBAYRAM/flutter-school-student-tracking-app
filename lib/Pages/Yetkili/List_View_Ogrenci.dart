import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewKullanimi extends StatelessWidget {
  ListViewKullanimi({Key? key}) : super(key: key);

  List<Ogrenci> tumOgrenciler = List.generate(
    5000,
    (index) => Ogrenci(
        index + 1, 'Ogrenci adı ${index + 1}', 'Ogrenci soyadı ${index + 1}'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Öğrenci Listesi'),
        ),
        body: klasikListView());
  }

  ListView klasikListView() {
    return ListView(
      children: tumOgrenciler
          .map(
            (Ogrenci ogr) => ListTile(
              title: Text(ogr.isim),
              subtitle: Text(ogr.soyisim),
              leading: CircleAvatar(
                child: Text(ogr.id.toString()),
              ),
            ),
          )
          .toList(),
    );
  }

  void _alertDialogIslemleri(BuildContext myContext, Ogrenci secilen) {
    showDialog(
        barrierDismissible: false,
        context: myContext,
        builder: (context) {
          return AlertDialog(
            title: Text(secilen.toString()),
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                Text('emre' * 100),
                Text('emre1' * 100),
                Text('emre2' * 100),
              ],
            )),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('KAPAT'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('TAMAM'),
                  ),
                ],
              )
            ],
          );
        });
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);

  @override
  String toString() {
    return 'Isim : $isim Soyisim:$soyisim id:$id';
  }
}
