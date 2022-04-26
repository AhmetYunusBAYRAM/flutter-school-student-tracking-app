import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ntp_odev/Pages/Yetkili/Ogrenci_Ekle.dart';
import 'package:ntp_odev/Pages/Yetkili/Yetkili_Page.dart';

import '../../constants/app_constants.dart';

class OgrenciSil extends StatefulWidget {
  const OgrenciSil({Key? key}) : super(key: key);

  @override
  State<OgrenciSil> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<OgrenciSil> {
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
  String Sinif = '';
  String Numara = '';

  String numara = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenci Silme Paneli'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _widgetOptions.elementAt(_selectedIndex),
              Center(
                child: Container(
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
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Öğrenci Silme Paneli',
                            style: Sabitler.baslikStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
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
                                  padding: const EdgeInsets.only(
                                      bottom: 6.0, left: 6, right: 6, top: 17),
                                  child: Text(
                                    Ad,
                                    style: Sabitler.Textbox2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    Soyad,
                                    style: Sabitler.Textbox2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    Sinif,
                                    style: Sabitler.Textbox2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    numara,
                                    style: Sabitler.Textbox2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            onChanged: (String deger) {
                              Numara = deger.toString();
                            },
                            decoration: InputDecoration(
                              labelText: 'Öğrenci Numarsını Giriniz.',
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                            ),
                          ),
                        ),
                        OutlineButton.icon(
                          onPressed: () {
                            Ogrenci_Ara();
                          },
                          label: Text('Öğrenciyi Ara'),
                          icon: Icon(
                            Icons.search,
                            color: (Colors.amber),
                          ),
                          color: Colors.red,
                          highlightColor: Colors.amber,
                          highlightedBorderColor: Colors.amber,
                        ),
                        OutlineButton.icon(
                          onPressed: () {
                            Ogrenci_Sil();
                          },
                          label: Text('Öğrenciyi Kalıcı Olarak Sil'),
                          icon: Icon(
                            Icons.delete_forever,
                            color: (Colors.red),
                          ),
                          color: Colors.red,
                          highlightColor: Colors.amber,
                          highlightedBorderColor: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
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

  void Ogrenci_Sil() async {
    String ID = '';
    bool durum = false;
    var _usersDocuments = await _firestore.collection('Ogrenciler').get();
    debugPrint(_usersDocuments.size.toString());
    debugPrint(_usersDocuments.docs.length.toString());

    for (var eleman in _usersDocuments.docs) {
      debugPrint('Döküman id ${eleman.id}');
      Map userMap = eleman.data();
      if (Numara == userMap['numara']) {
        ID = eleman.id;
        debugPrint('Bulunanan ID : ' + ID);
        setState(() {
          Ad = '';
          Soyad = '';
          numara = '';
          Sinif = '';
        });
        await _firestore.doc('Ogrenciler/${ID}').delete();
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
        debugPrint(userMap['OgrenciBilgisi']!['ad'].toString());
        durum = true;
      } else {
        durum = false;
      }
      debugPrint(userMap['OgrenciBilgisi'].toString());
      if (ID == '') {
        setState(() {
          Ad = 'Aradığınız bilgilere Sayip Öğrenci Bulunamadı !!!';
        });
      }
    }
  }

  void Ogrenci_Ara() async {
    String ID = '';
    bool durum = false;
    var _usersDocuments = await _firestore.collection('Ogrenciler').get();
    debugPrint(_usersDocuments.size.toString());
    debugPrint(_usersDocuments.docs.length.toString());

    for (var eleman in _usersDocuments.docs) {
      debugPrint('Döküman id ${eleman.id}');
      Map userMap = eleman.data();
      if (Numara == userMap['numara']) {
        ID = eleman.id;
        debugPrint('Bulunanan ID : ' + ID);
        setState(() {
          Ad = 'Ad : ' + userMap['ad'];
          Soyad = 'Soyad : ' + userMap['soyad'];
          numara = 'Numara : ' + userMap['numara'];
          Sinif = 'Sınıf : ' + userMap['sinif'];
        });
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title:
                      Text('İşlem Başarıyla Yapıldı', style: Sabitler.Textbox5),
                  content: Text('Kullanıcı Başarıyla Bulundu.',
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
        debugPrint(userMap['ad'].toString());
        durum = true;
      } else {
        durum = false;
      }

      if (ID == '') {
        setState(() {
          Ad = 'Aradığınız bilgilere Sayip Öğrenci Bulunamadı !!!';
          Soyad = '';
          numara = '';
          Sinif = '';
        });
      }
    }
  }
}
