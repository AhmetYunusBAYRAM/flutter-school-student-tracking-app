import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ntp_odev/Pages/Yetkili/Yetkili_Page.dart';
import 'package:ntp_odev/constants/app_constants.dart';

import 'Ogretmen_Ekle_.dart';

class Ogretmen_Sil extends StatefulWidget {
  const Ogretmen_Sil({Key? key}) : super(key: key);

  @override
  State<Ogretmen_Sil> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Ogretmen_Sil> {
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
            .push(MaterialPageRoute(builder: (context) => Ogretmen_Ekle()));
      } else if (_selectedIndex == 1) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Ogretmen_Sil()));
      } else if (_selectedIndex == 2) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Yetkili()));
      }
    });
  }

  String Ad = '';
  String Soyad = '';
  String Ders = '';
  String Email = '';
  String Durum = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğretmen Silme Paneli'),
      ),
      body: Center(
        child: Container(
          height: 550,
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
                padding: const EdgeInsets.only(top: 30.0),
                child:
                    Text('Öğretmen Silme Paneli ', style: Sabitler.baslikStyle),
              ),
              _widgetOptions.elementAt(_selectedIndex),
              Container(
                height: 200,
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
                      padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
                      child: Text(
                        Ad,
                        style: Sabitler.Textbox2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Soyad,
                        style: Sabitler.Textbox2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Ders,
                        style: Sabitler.Textbox2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Email,
                        style: Sabitler.Textbox2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: TextField(
                  onChanged: (String deger) {
                    Email = deger.toString();
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton.icon(
                  onPressed: () {
                    arama();
                  },
                  label: Text('Öğretmeni Ara'),
                  icon: Icon(
                    Icons.search,
                    color: (Colors.green),
                  ),
                  color: Colors.red,
                  highlightColor: Colors.green,
                  highlightedBorderColor: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton.icon(
                  onPressed: () {
                    YetkiliSilme();
                  },
                  label: Text('Öğretmeni Sil'),
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: (Colors.red),
                  ),
                  color: Colors.red,
                  highlightColor: Colors.red,
                  highlightedBorderColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Öğretmen Ekle',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Öğretmen Sil',
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

  String ID = '';
  void arama() async {
    bool durum = false;
    var _usersDocuments = await _firestore.collection('Ogretmen').get();
    debugPrint(_usersDocuments.size.toString());
    debugPrint(_usersDocuments.docs.length.toString());

    for (var eleman in _usersDocuments.docs) {
      debugPrint('Döküman id ${eleman.id}');
      Map userMap = eleman.data();
      if (Email == userMap['Bilgiler']['email']) {
        ID = eleman.id;
        debugPrint('Bulunanan ID : ' + ID);
        setState(() {
          Ad = 'Ad : ' + userMap['Bilgiler']!['ad'];
          Soyad = 'Soyad : ' + userMap['Bilgiler']!['soyad'];
          Ders = 'Ders : ' + userMap['Bilgiler']!['ders'];
          Email = 'Email : ' + userMap['Bilgiler']!['email'];
          userMap.clear();
        });

        debugPrint(userMap['Bilgiler']!['ad'].toString());
        durum = true;
      } else {
        durum = false;
      }
      debugPrint(userMap['Bilgiler'].toString());
    }
  }

  void YetkiliSilme() async {
    Ad = '';
    Soyad = '';
    bool durum = false;
    var _usersDocuments = await _firestore.collection('Ogretmen').get();
    debugPrint(_usersDocuments.size.toString());
    debugPrint(_usersDocuments.docs.length.toString());
    if (ID != '') {
      await _firestore.doc('Ogretmen/${ID}').delete();
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
  }
}
