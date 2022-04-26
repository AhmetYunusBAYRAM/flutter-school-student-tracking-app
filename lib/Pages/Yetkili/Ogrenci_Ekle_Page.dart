import 'package:flutter/material.dart';

import 'Ogrenci_Ekle.dart';
import 'Yetkili_Page.dart';
import 'Öğrenci_Sil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: OgrenciEkle(),
    );
  }
}

class OgrenciEkle extends StatefulWidget {
  const OgrenciEkle({Key? key}) : super(key: key);

  @override
  State<OgrenciEkle> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<OgrenciEkle> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenci Ekleme Paneli'),
      ),
      body: Center(
        child: Column(
          children: [
            _widgetOptions.elementAt(_selectedIndex),
          ],
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
            icon: Icon(Icons.delete),
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
}
