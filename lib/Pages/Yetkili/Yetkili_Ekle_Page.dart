import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntp_odev/constants/app_constants.dart';

String Ad = '';
String Soyad = '';
String Email = '';
String Parola = '';
String _Email = "";

class YetkiliEklemePanel extends StatelessWidget {
  const YetkiliEklemePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    void yetkilEkle() async {
      bool kayitIzin = false;

      if (Ad != '' && Soyad != '' && Parola != '' && Email != '') {
        var _usersDocuments = await _firestore.collection('Yetkili').get();
        debugPrint(_usersDocuments.size.toString());
        debugPrint(_usersDocuments.docs.length.toString());

        for (var eleman in _usersDocuments.docs) {
          Map userMap = eleman.data();
          debugPrint(userMap['Bilgiler']['email'].toString());
          if (userMap['Bilgiler']['email'].toString() == Email) {
            kayitIzin = false;
          } else {
            kayitIzin = true;
          }
        }
      }
      debugPrint(kayitIzin.toString());
      if (kayitIzin == true) {
        Map<String, dynamic> _eklenecekUser = <String, dynamic>{};
        _eklenecekUser['Bilgiler'] = {
          'ad': Ad,
          'email': Email,
          'parola': Parola,
          'Soyad': Soyad
        };
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title:
                      Text('İşlem Başarıyla Yapıldı', style: Sabitler.Textbox5),
                  content: Text('Kullanıcı Başarıyla Kaydedildi.',
                      style: Sabitler.Textbox2),
                  backgroundColor: Colors.white,
                  actions: [
                    OutlineButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      label: Text('Tamam'),
                      icon: Icon(
                        Icons.task_alt_rounded,
                        color: (Colors.green),
                      ),
                      color: Colors.green,
                      highlightColor: Colors.amber,
                      highlightedBorderColor: Colors.amber,
                    )
                  ],
                ));
        await _firestore.collection('Yetkili').add(_eklenecekUser);
      }
    }

    void YetkiliSilme() async {
      String ID = '';
      bool durum = false;
      var _usersDocuments = await _firestore.collection('Yetkili').get();
      debugPrint(_usersDocuments.size.toString());
      debugPrint(_usersDocuments.docs.length.toString());

      for (var eleman in _usersDocuments.docs) {
        debugPrint('Döküman id ${eleman.id}');
        Map userMap = eleman.data();
        if (_Email == userMap['Bilgiler']!['email']) {
          ID = eleman.id;
          durum = true;
        } else {
          durum = false;
        }

        debugPrint(userMap['Bilgiler'].toString());
      }
      if (ID != '') {
        await _firestore.doc('Yetkili/${ID}').delete();
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title:
                      Text('İşlem Başarıyla Yapıldı', style: Sabitler.Textbox5),
                  content: Text('Kullanıcı Başarıyla Silindi.',
                      style: Sabitler.Textbox2),
                  backgroundColor: Colors.white,
                  actions: [
                    OutlineButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      label: Text('Tamam'),
                      icon: Icon(
                        Icons.task_alt_rounded,
                        color: (Colors.green),
                      ),
                      color: Colors.green,
                      highlightColor: Colors.amber,
                      highlightedBorderColor: Colors.amber,
                    )
                  ],
                ));
      }
      debugPrint(ID);
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Yetkili Ekleme',
            style: Sabitler.baslikStyle,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 200.0),
                  child: Column(
                    children: [
                      Container(
                        height: 430,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 7.0,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Text(
                                'Yetkili Kullanıcı Ekleme',
                                style: Sabitler.baslikStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0,
                                  left: 8.0,
                                  right: 8.0,
                                  bottom: 8.0),
                              child: TextField(
                                onChanged: (String deger) {
                                  Ad = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Ad',
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (String deger) {
                                  Soyad = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Soyad',
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (String deger) {
                                  Email = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (String deger) {
                                  Parola = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Parola',
                                  prefixIcon: Icon(Icons.password),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                ),
                              ),
                            ),
                            OutlineButton.icon(
                              onPressed: () {
                                yetkilEkle();
                              },
                              label: Text('Yetkili Kişiyi Kaydet'),
                              icon: Icon(
                                Icons.add,
                                color: (Colors.green),
                              ),
                              color: Colors.red,
                              highlightColor: Colors.amber,
                              highlightedBorderColor: Colors.amber,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Container(
                          height: 170,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 7.0,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Yetkili Sil',
                                  style: Sabitler.Textbox,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (String deger) {
                                    _Email = deger.toString();
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.email),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                  ),
                                ),
                              ),
                              OutlineButton.icon(
                                onPressed: () {
                                  YetkiliSilme();
                                },
                                label: Text('Email ile ara ve sil'),
                                icon: Icon(
                                  Icons.delete,
                                  color: (Colors.red),
                                ),
                                color: Colors.red,
                                highlightColor: Colors.amber,
                                highlightedBorderColor: Colors.amber,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
