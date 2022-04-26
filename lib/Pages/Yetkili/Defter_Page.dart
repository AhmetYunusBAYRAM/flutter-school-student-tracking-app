import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ntp_odev/constants/app_constants.dart';

class Defter extends StatefulWidget {
  const Defter({Key? key}) : super(key: key);

  @override
  State<Defter> createState() => _DefterState();
}

String dropdownValue1 = ' ';
String dropdownValue2 = ' ';
String dropdownValue3 = ' ';
String dropdownValue4 = ' ';

List<Defterdepo> defter = [];
String Ay2 = '';
String Gun = '';
String Ay = '';
String Yil = '';
String HaftaGun = '';
String Sinf = '';

class _DefterState extends State<Defter> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 45.0),
          child: Text(
            'Defter',
            style: Sabitler.baslikStyle,
          ),
        )),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 370,
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
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 8, right: 8, bottom: 8),
                    child: Text(
                      'Defter Sorgulama',
                      style: Sabitler.baslikStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, right: 8, left: 8, bottom: 8),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 7.0,
                            ),
                          ]),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Gün Seçiniz : ',
                              style: Sabitler.Textbox2,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: DropdownButton<String>(
                                value: dropdownValue3,
                                icon: const Icon(Icons.date_range),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.amber,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue3 = newValue!;
                                    Gun = dropdownValue3;
                                  });
                                },
                                items: <String>[
                                  ' ',
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7',
                                  '8',
                                  '9',
                                  '10',
                                  '11',
                                  '12',
                                  '13',
                                  '14',
                                  '15',
                                  '16',
                                  '17',
                                  '18',
                                  '19',
                                  '20',
                                  '21',
                                  '23',
                                  '24',
                                  '25',
                                  '16',
                                  '27',
                                  '28',
                                  '29',
                                  '30',
                                  '31',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 7.0,
                          ),
                        ]),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            'Ay Seçiniz : ',
                            style: Sabitler.Textbox2,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 80),
                            child: DropdownButton<String>(
                              value: dropdownValue2,
                              icon: const Icon(Icons.date_range),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.amber,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;
                                  Ay2 = dropdownValue2;
                                });
                              },
                              items: <String>[
                                ' ',
                                'Ocak',
                                'Şubat',
                                'Mart',
                                'Nisan',
                                'Mayıs',
                                'Haziran',
                                'Temmuz',
                                'Ağustos',
                                'Eylül',
                                'Ekim',
                                'Kasım',
                                'Aralık'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 7.0,
                            ),
                          ]),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Yıl Seçiniz : ',
                              style: Sabitler.Textbox2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: DropdownButton<String>(
                              value: dropdownValue4,
                              icon: const Icon(Icons.date_range),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.amber,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue4 = newValue!;
                                  Yil = dropdownValue4;
                                });
                              },
                              items: <String>[
                                ' ',
                                '2022',
                                '2023',
                                '2024',
                                '2025',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Text('Lütfen Gün Seçiniz'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 7.0,
                            ),
                          ]),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Sınıf Seçiniz : ',
                              style: Sabitler.Textbox2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 65),
                            child: DropdownButton<String>(
                              value: dropdownValue1,
                              icon: const Icon(Icons.date_range),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.amber,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue1 = newValue!;
                                  Sinf = dropdownValue1;
                                });
                              },
                              items: <String>[
                                ' ',
                                '9-A',
                                '9-B',
                                '9-C',
                                '9-D',
                                '10-A',
                                '10-B',
                                '10-C',
                                '10-D',
                                '11-A',
                                '11-C',
                                '11-D',
                                '12-A',
                                '12-B',
                                '12-C',
                                '12-D'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Text('Sınıf Seçiniz'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton.icon(
                      onPressed: () {
                        Getir();
                      },
                      label: Text('Defteri Getir'),
                      icon: Icon(
                        Icons.search,
                        color: (Colors.green),
                      ),
                      color: Colors.red,
                      highlightColor: Colors.amber,
                      highlightedBorderColor: Colors.amber,
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                    children: defter
                        .map((Defterdepo ogr) => Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.horizontal,
                              onDismissed: (a) {},
                              child: Card(
                                  color: Colors.grey.shade200,
                                  shadowColor: Colors.white,
                                  elevation: 12,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('Öğretmen Adı : ' +
                                            ogr.OgretmenAd +
                                            ' ' +
                                            ogr.OgretmenSoyad),
                                        subtitle: Text(
                                            ogr.bulunanDers.toUpperCase() +
                                                ' Gelmeyenler :  ' +
                                                ogr.Gelmeyen),
                                        leading: CircleAvatar(
                                          backgroundColor: Sabitler.anaRenk2,
                                          child: Text(
                                            ogr.Sinif,
                                            style: Sabitler.Textbox2,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 20),
                                        child: Container(
                                          height: 200,
                                          width: 300,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade500,
                                                  blurRadius: 7.0,
                                                ),
                                              ]),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20.0,
                                                          bottom: 10),
                                                  child: Text(
                                                    'Ders Kazanımı',
                                                    style: Sabitler.Textbox2,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0,
                                                          left: 16,
                                                          top: 0),
                                                  child: Text(
                                                    ogr.Kazanim,
                                                    style: Sabitler.Textbox6,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ))
                        .toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ayCevirici() {
    if (Ay2 == 'Ocak') {
      Ay = 'January';
    }
    if (Ay2 == 'Şubat') {
      Ay = 'February';
    }
    if (Ay2 == 'Mart') {
      Ay = 'March';
    }
    if (Ay2 == 'Nisan') {
      Ay = 'April';
    }
    if (Ay2 == 'Mayıs') {
      Ay = 'May';
    }
    if (Ay2 == 'Haziran') {
      Ay = 'June';
    }
    if (Ay2 == 'Temmuz') {
      Ay = 'July';
    }
    if (Ay2 == 'Ağustos') {
      Ay = 'August';
    }
    if (Ay2 == 'Eylül') {
      Ay = 'September';
    }
    if (Ay2 == 'Ekim') {
      Ay = 'October';
    }
    if (Ay2 == 'Kasım') {
      Ay = 'November  ';
    }
    if (Ay2 == 'Aralık') {
      Ay = 'December';
    }
  }

  void Getir() async {
    ayCevirici();
    defter.clear();
    bool durum = false;

    var _userRef = _firestore.collection('Defter');
    var _sonuc = await _userRef.where('sinif', isEqualTo: Sinf).get();

    for (var user in _sonuc.docs) {
      Map userMap = user.data();

      setState(() {
        try {
          if (userMap['yil'] == Yil &&
              userMap['gun'] == Gun &&
              userMap['ay'] == Ay) {
            defter.add(Defterdepo(
                userMap['ad'],
                userMap['soyad'],
                userMap['ders'],
                userMap['gun'],
                userMap['ay'],
                userMap['yil'],
                userMap['kazanim'],
                userMap['sinif'],
                userMap['gelmeyenler'],
                userMap['bulunanDers']));
            debugPrint('Giridi');
            durum = true;
          }
        } catch (e) {
          durum = false;
        }
      });

      debugPrint('Ay ' + Ay);
      debugPrint('Yıl ' + Yil);
      debugPrint('Gün ' + Gun);
      debugPrint(user.data().toString());

      for (var item in defter) {
        debugPrint(item.Ders);
        debugPrint(item.Kazanim);
        debugPrint(item.OgretmenAd);
        debugPrint(item.OgretmenSoyad);
        debugPrint(item.Sinif);
        debugPrint(item.Gelmeyen.toString());
        debugPrint(item.bulunanDers);
        break;
      }
    }
    if (durum) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title:
                    Text('İşlem Başarıyla Yapıldı', style: Sabitler.Textbox5),
                content: Text('İstediğiniz Kriterlere Sayip Bilgiler Bulundu',
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
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Hata', style: Sabitler.Textbox),
                content: Text(
                    'İstediğiniz Kriterlere Sayip Bilgiler Bulunamadı',
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
  }
}

class Defterdepo {
  final String OgretmenAd;
  final String OgretmenSoyad;
  final String Ders;
  final String gun;
  final String ay;
  final String yil;
  final String Kazanim;
  final String Sinif;
  final String Gelmeyen;
  final String bulunanDers;

  //final String bulunanDers;
  Defterdepo(this.OgretmenAd, this.OgretmenSoyad, this.Ders, this.gun, this.ay,
      this.yil, this.Kazanim, this.Sinif, this.Gelmeyen, this.bulunanDers);
}
