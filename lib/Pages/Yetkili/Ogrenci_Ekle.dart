import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ntp_odev/constants/app_constants.dart';

import 'Yetkili_Page.dart';
import 'Öğrenci_Sil.dart';

class Ogrenci_Ekle extends StatefulWidget {
  const Ogrenci_Ekle({Key? key}) : super(key: key);

  @override
  State<Ogrenci_Ekle> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Ogrenci_Ekle> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      '',
      style: optionStyle,
    ),
    Text(
      '',
      style: optionStyle,
    ),
  ];

  ///DEVAMINI GETİR

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Ogrenci_Ekle()));
      } else if (_selectedIndex == 1) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => OgrenciSil()));
      } else if (_selectedIndex == 2) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Yetkili()));
      }
    });
  }

  String Ad = '';
  String Soyad = '';
  String Numara = '';
  String Sinif = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenci Ekleme '),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            _widgetOptions.elementAt(_selectedIndex),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Container(
                height: 470,
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
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 18),
                        child: Text(
                          'Öğrenci Ekleme Paneli',
                          style: Sabitler.baslikStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18.0, left: 18.0, right: 18.0),
                        child: TextField(
                          onChanged: (String deger) {
                            Ad = deger.toString();
                          },
                          decoration: InputDecoration(
                            labelText: 'Öğrenci Ad',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextField(
                          onChanged: (String deger) {
                            Soyad = deger.toString();
                          },
                          decoration: InputDecoration(
                            labelText: 'Öğrenci Soyad',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 2.0, left: 18.0, right: 18.0),
                        child: TextField(
                          onChanged: (String deger) {
                            Sinif = deger.toString();
                          },
                          decoration: InputDecoration(
                            labelText: 'Öğrenci Sınıf  Örnek: 11-C',
                            prefixIcon: Icon(Icons.class_),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextField(
                          onChanged: (String deger) {
                            Numara = deger.toString();
                          },
                          decoration: InputDecoration(
                            labelText: 'Öğrenci Numarası',
                            prefixIcon: Icon(Icons.filter_1_outlined),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlineButton.icon(
                          onPressed: () {
                            OgrenciEkle();
                          },
                          label: Text('Öğrencinin Kaydını Yap'),
                          icon: Icon(
                            Icons.save,
                            color: (Colors.green),
                          ),
                          color: Colors.red,
                          highlightColor: Colors.amber,
                          highlightedBorderColor: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Öğrenci EKLE',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Öğrenci Sil',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu Git',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void OgrenciEkle() async {
    Map<String, dynamic> _eklenecekUser = <String, dynamic>{};
    _eklenecekUser = {
      'ad': Ad,
      'numara': Numara,
      'sinif': Sinif,
      'soyad': Soyad
    };
    await _firestore.collection('Ogrenciler').add(_eklenecekUser);
  }
}
