import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntp_odev/Pages/Yetkili/Ogretmen_Ekle_.dart';
import 'package:intl/intl.dart';

import '../../constants/app_constants.dart';
import '../../main.dart';

//Dersleri Tutan List
List<String> PazartesiDersler = [];
List<String> SaliDersler = [];
List<String> CarsambaDersler = [];
List<String> PersembeDersler = [];
List<String> CumaDersler = [];
String Gelmeyenler = '';
int hak = -1;
String durum = '';

String Kazanim = '';

String GirisYapilanEmail = Todo.title;
String oAnkiDers = '';

String OgrtmnAd = '';
String OgrtmnSoyad = '';
String OgrtmnDers = '';
String BulunanSinif = '';

List<Ogrenci> tumOgrenciler = [];

class Ogretmen extends StatefulWidget {
  const Ogretmen({Key? key}) : super(key: key);

  @override
  State<Ogretmen> createState() => _OgretmenState();
}

class _OgretmenState extends State<Ogretmen> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    void sinifGetir() async {
      var date = DateTime.now();
      String Gun = DateFormat('EEEE').format(date);
      dersBul();
      String ID = '';
      bool durum = false;
      var _usersDocuments = await _firestore.collection('Ogretmen').get();
      debugPrint(_usersDocuments.size.toString());
      debugPrint(_usersDocuments.docs.length.toString());

      for (var eleman in _usersDocuments.docs) {
        debugPrint('Döküman id ${eleman.id}');
        Map userMap = eleman.data();
        if (GirisYapilanEmail == userMap['Bilgiler']['email']) {
          ID = eleman.id;
          debugPrint('Bulunanan ID : ' + ID);
          OgrtmnAd = userMap['Bilgiler']!['ad'];
          OgrtmnSoyad = userMap['Bilgiler']!['soyad'];
          OgrtmnDers = userMap['Bilgiler']!['ders'];
          try {
            BulunanSinif = userMap['Bilgiler']!['ders programi']!['${Gun}']![
                    '${oAnkiDers}']
                .toString();
          } catch (e) {
            tumOgrenciler.clear();
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text('Hata', style: Sabitler.Textbox),
                      content: Text(
                          'Bu saat aralığına tanımlanmış dersiniz bulunmuyor.',
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
    }

    void DefteriDoldur() async {
      if (!tumOgrenciler.isEmpty) {
        var date = DateTime.now();
        Map<String, dynamic> _eklenecekUser = <String, dynamic>{};
        _eklenecekUser = {
          'ad': OgrtmnAd,
          'soyad': OgrtmnSoyad,
          'gelmeyenler': Gelmeyenler,
          'gun': DateFormat('d').format(date).toString(),
          'ay': DateFormat('MMMM').format(date).toString(),
          'yil': DateFormat('yyyy').format(date).toString(),
          'sinif': BulunanSinif,
          'ders': OgrtmnDers,
          'kazanim': Kazanim,
          'bulunanDers': oAnkiDers
        };
        await _firestore.collection('Defter').add(_eklenecekUser);
      } else {
        Navigator.of(context).pop();

        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Hata', style: Sabitler.Textbox),
                  content: Text('Öğrenci Yok', style: Sabitler.Textbox2),
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

    void OgrenciGetir() async {
      sinifGetir();
      tumOgrenciler.clear();
      Gelmeyenler = '';
      var _userRef = _firestore.collection('Ogrenciler');
      var _sonuc = await _userRef.where('sinif', isEqualTo: BulunanSinif).get();

      for (var user in _sonuc.docs) {
        setState(() {});
        Map userMap = user.data();
        setState(() {
          tumOgrenciler.add(Ogrenci(
              int.parse(userMap['numara']), userMap['ad'], userMap['soyad']));
        });

        debugPrint(user.data().toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Öğretmen Sayfa',
            style: Sabitler.baslikStyle,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 30),
                        child: Container(
                          height: 400,
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
                                padding:
                                    const EdgeInsets.only(right: 0.0, top: 6),
                                child: Text(
                                  'Kazanım girmen alanı',
                                  style: Sabitler.Textbox3,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  maxLines: 7,
                                  maxLength: 250,
                                  onChanged: (deger) {
                                    Kazanim = deger;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    hintText: 'Kazanım Giriniz.',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 0,
                                ),
                                child: Container(
                                  height: 150,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: OutlineButton.icon(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                      title: Text(
                                                          'Defteri Doldurmak İstiyormusunuz ?'),
                                                      actions: [
                                                        Row(
                                                          children: [
                                                            OutlineButton.icon(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              label: Text(
                                                                  'Onaylama'),
                                                              icon: Icon(
                                                                Icons
                                                                    .exit_to_app,
                                                                color: (Colors
                                                                    .red),
                                                              ),
                                                              color: Colors.red,
                                                              highlightColor:
                                                                  Colors.amber,
                                                              highlightedBorderColor:
                                                                  Colors.amber,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          60.0),
                                                              child:
                                                                  OutlineButton
                                                                      .icon(
                                                                onPressed: () {
                                                                  DefteriDoldur();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                label: Text(
                                                                    'Onayla '),
                                                                icon: Icon(
                                                                  Icons.book,
                                                                  color: (Colors
                                                                      .green),
                                                                ),
                                                                color:
                                                                    Colors.red,
                                                                highlightColor:
                                                                    Colors
                                                                        .amber,
                                                                highlightedBorderColor:
                                                                    Colors
                                                                        .amber,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                      elevation: 24.0,
                                                      backgroundColor:
                                                          Colors.white,
                                                    ));
                                          },
                                          label: Text(
                                              'Yoklamayı Ve Defteri Doldur'),
                                          icon: Icon(
                                            Icons.note_alt_outlined,
                                            color: (Colors.green),
                                          ),
                                          color: Colors.red,
                                          highlightColor: Colors.amber,
                                          highlightedBorderColor: Colors.amber,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: OutlineButton.icon(
                                          onPressed: () {
                                            OgrenciGetir();
                                          },
                                          label: Text('Yoklama Al'),
                                          icon: Icon(
                                            Icons.person,
                                            color: (Colors.green),
                                          ),
                                          color: Colors.green,
                                          highlightColor: Colors.amber,
                                          highlightedBorderColor: Colors.amber,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
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
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 10, right: 1, left: 0),
                          child: Column(
                            children: [
                              Text('Öğrenciler', style: Sabitler.Textbox3),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_back_outlined,
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 0.0),
                                        child: Text(
                                          'Yok Yaz',
                                          style: Sabitler.Textbox4,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 195.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Var Yaz',
                                                style: Sabitler.Textbox5,
                                              ),
                                              Icon(Icons.arrow_forward_outlined,
                                                  color: Colors.green),
                                            ],
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                            children: tumOgrenciler
                                .map((Ogrenci ogr) => Dismissible(
                                      key: UniqueKey(),
                                      direction: DismissDirection.horizontal,
                                      onDismissed: (a) {
                                        if (a == DismissDirection.endToStart) {
                                          if (Gelmeyenler == '') {
                                            Gelmeyenler = Gelmeyenler +
                                                ogr.numara.toString();
                                          } else {
                                            Gelmeyenler = Gelmeyenler +
                                                ' ,  ' +
                                                ogr.numara.toString();
                                          }
                                          setState(() {
                                            tumOgrenciler.removeAt(
                                                tumOgrenciler.indexOf(Ogrenci(
                                                    ogr.numara,
                                                    ogr.isim,
                                                    ogr.soyisim)));
                                          });
                                        } else {
                                          debugPrint(
                                              ogr.isim + ' Adlı Öğrenci Var');
                                          setState(() {
                                            tumOgrenciler.removeAt(
                                                tumOgrenciler.indexOf(Ogrenci(
                                                    ogr.numara,
                                                    ogr.isim,
                                                    ogr.soyisim)));
                                          });
                                        }
                                      },
                                      child: Card(
                                          color: Colors.grey.shade200,
                                          shadowColor: Colors.white,
                                          elevation: 12,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(ogr.isim +
                                                    ' ' +
                                                    ogr.soyisim),
                                                subtitle:
                                                    Text(ogr.numara.toString()),
                                              ),
                                            ],
                                          )),
                                    ))
                                .toList()),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void dersBul() {
    var date = DateTime.now();
    double saat = double.parse(DateFormat('HH.mm').format(date));
    if (double.parse(DateFormat('HH.mm').format(date)) > 8.50 &&
        double.parse(DateFormat('HH.mm').format(date)) < 9.30) {
      oAnkiDers = 'ders1';
    }
    if (double.parse(DateFormat('HH.mm').format(date)) > 9.40 &&
        double.parse(DateFormat('HH.mm').format(date)) < 10.20) {
      oAnkiDers = 'ders2';
    }
    if (double.parse(DateFormat('HH.mm').format(date)) > 10.30 &&
        double.parse(DateFormat('HH.mm').format(date)) < 11.10) {
      oAnkiDers = 'ders3';
    }
    if (double.parse(DateFormat('HH.mm').format(date)) > 11.20 &&
        double.parse(DateFormat('HH.mm').format(date)) < 12.00) {
      oAnkiDers = 'ders4';
    }
    if (double.parse(DateFormat('HH.mm').format(date)) > 12.10 &&
        double.parse(DateFormat('HH.mm').format(date)) < 12.50) {
      oAnkiDers = 'ders5';
    }
    if (double.parse(DateFormat('HH.mm').format(date)) > 13.20 &&
        double.parse(DateFormat('HH.mm').format(date)) < 14.00) {
      oAnkiDers = 'ders6';
    }
    if (double.parse(DateFormat('HH.mm').format(date)) > 14.10 &&
        double.parse(DateFormat('HH.mm').format(date)) < 14.50) {
      oAnkiDers = 'ders7';
    }
    if (double.parse(DateFormat('HH.mm').format(date)) > 15.00 &&
        double.parse(DateFormat('HH.mm').format(date)) < 15.40) {
      oAnkiDers = 'ders8';
    }
    if (double.parse(DateFormat('HH.mm').format(date)) > 15.50 &&
        double.parse(DateFormat('HH.mm').format(date)) < 16.20) {
      oAnkiDers = 'ders9';
    }
    if (double.parse(DateFormat('HH.mm').format(date)) > 16.10 &&
        double.parse(DateFormat('HH.mm').format(date)) < 16.40) {
      oAnkiDers = 'ders10';
    }
    debugPrint('Bulunan Ders:  ' + oAnkiDers);
  }
}

class Ogrenci {
  final int numara;
  final String isim;
  final String soyisim;
  Ogrenci(this.numara, this.isim, this.soyisim);
}
