import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ntp_odev/Pages/Yetkili/Ogretmen_Sil_%20.dart';

import '../../constants/app_constants.dart';
import 'Yetkili_Page.dart';

String Ad = '';
String Soyad = '';
String Email = '';
String Parola = '';
String Ders = '';
String _Email = "";

//////////////////////
String Pzrt_Ders1 = '';
String Pzrt_Ders2 = '';
String Pzrt_Ders3 = '';
String Pzrt_Ders4 = '';
String Pzrt_Ders5 = '';
String Pzrt_Ders6 = '';
String Pzrt_Ders7 = '';
String Pzrt_Ders8 = '';
String Pzrt_Ders9 = '';
String Pzrt_Ders10 = '';

///////////////////////
String Sali_Ders1 = '';
String Sali_Ders2 = '';
String Sali_Ders3 = '';
String Sali_Ders4 = '';
String Sali_Ders5 = '';
String Sali_Ders6 = '';
String Sali_Ders7 = '';
String Sali_Ders8 = '';
String Sali_Ders9 = '';
String Sali_Ders10 = '';

/////////////////////////
String Crs_Ders1 = '';
String Crs_Ders2 = '';
String Crs_Ders3 = '';
String Crs_Ders4 = '';
String Crs_Ders5 = '';
String Crs_Ders6 = '';
String Crs_Ders7 = '';
String Crs_Ders8 = '';
String Crs_Ders9 = '';
String Crs_Ders10 = '';

//////////////////////
String Prsm_Ders1 = '';
String Prsm_Ders2 = '';
String Prsm_Ders3 = '';
String Prsm_Ders4 = '';
String Prsm_Ders5 = '';
String Prsm_Ders6 = '';
String Prsm_Ders7 = '';
String Prsm_Ders8 = '';
String Prsm_Ders9 = '';
String Prsm_Ders10 = '';

//////////////////////////
String Cuma_Ders1 = '';
String Cuma_Ders2 = '';
String Cuma_Ders3 = '';
String Cuma_Ders4 = '';
String Cuma_Ders5 = '';
String Cuma_Ders6 = '';
String Cuma_Ders7 = '';
String Cuma_Ders8 = '';
String Cuma_Ders9 = '';
String Cuma_Ders10 = '';

class Ogretmen_Ekle extends StatefulWidget {
  const Ogretmen_Ekle({Key? key}) : super(key: key);

  @override
  State<Ogretmen_Ekle> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Ogretmen_Ekle> {
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

  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Öğretmen Ekleme Paneli'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _widgetOptions.elementAt(_selectedIndex),
              Center(
                child: Column(
                  children: [
                    ///Ad soyad parola email alma kısmı
                    Container(
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 10,
                              left: 10,
                              right: 10,
                            ),
                            child: Text('Öğretmen Bilgilerini Giriniz.',
                                style: Sabitler.baslikStyle),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                Ders = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Ders',
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
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Ders Programlarını Yazınız. Örnek: "11C"',
                        style: Sabitler.Textbox,
                      ),
                    ),

                    ///Pazartesi Ders programı için 10 ders texbox

                    Container(
                      height: 830,
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
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Pazartesi',
                              style: Sabitler.baslikStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (String deger) {
                                Pzrt_Ders1 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Pazaretesi Ders 1',
                                prefixIcon: Icon(Icons.book),
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
                                Pzrt_Ders2 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Pazaretesi Ders 2',
                                prefixIcon: Icon(Icons.book),
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
                                Pzrt_Ders3 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Pazaretesi Ders 3',
                                prefixIcon: Icon(Icons.book),
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
                                Pzrt_Ders4 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Pazaretesi Ders 4',
                                prefixIcon: Icon(Icons.book),
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
                                Pzrt_Ders5 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Pazaretesi Ders 5',
                                prefixIcon: Icon(Icons.book),
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
                                Pzrt_Ders6 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Pazaretesi Ders 6',
                                prefixIcon: Icon(Icons.book),
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
                                Pzrt_Ders7 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Pazaretesi Ders 7',
                                prefixIcon: Icon(Icons.book),
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
                                Pzrt_Ders8 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Pazaretesi Ders 8',
                                prefixIcon: Icon(Icons.book),
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
                                Pzrt_Ders9 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Pazaretesi Ders 9',
                                prefixIcon: Icon(Icons.book),
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
                                Pzrt_Ders10 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Pazaretesi Ders 10',
                                prefixIcon: Icon(Icons.book),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///Salı Ders programı için 10 ders texbox
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        height: 830,
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
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Salı',
                                style: Sabitler.baslikStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (String deger) {
                                  Sali_Ders1 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Salı Ders 1',
                                  prefixIcon: Icon(Icons.book),
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
                                  Sali_Ders2 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Salı Ders 2',
                                  prefixIcon: Icon(Icons.book),
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
                                  Sali_Ders3 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Salı Ders 3',
                                  prefixIcon: Icon(Icons.book),
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
                                  Sali_Ders4 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Salı Ders 4',
                                  prefixIcon: Icon(Icons.book),
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
                                  Sali_Ders5 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Salı Ders 5',
                                  prefixIcon: Icon(Icons.book),
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
                                  Sali_Ders6 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Salı Ders 6',
                                  prefixIcon: Icon(Icons.book),
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
                                  Sali_Ders7 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Salı Ders 7',
                                  prefixIcon: Icon(Icons.book),
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
                                  Sali_Ders8 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Salı Ders 8',
                                  prefixIcon: Icon(Icons.book),
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
                                  Sali_Ders9 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Salı Ders 9',
                                  prefixIcon: Icon(Icons.book),
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
                                  Sali_Ders10 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Salı Ders 10',
                                  prefixIcon: Icon(Icons.book),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///Çarsamba Ders programı için 10 ders texbox
                    Container(
                      height: 830,
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
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Çarşamba',
                              style: Sabitler.baslikStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (String deger) {
                                Crs_Ders1 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Çarşamba Ders 1',
                                prefixIcon: Icon(Icons.book),
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
                                Crs_Ders2 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Çarşamba Ders 2',
                                prefixIcon: Icon(Icons.book),
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
                                Crs_Ders3 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Çarşamba Ders 3',
                                prefixIcon: Icon(Icons.book),
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
                                Crs_Ders4 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Çarşamba Ders 4',
                                prefixIcon: Icon(Icons.book),
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
                                Crs_Ders5 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Çarşamba Ders 5',
                                prefixIcon: Icon(Icons.book),
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
                                Crs_Ders6 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Çarşamba Ders 6',
                                prefixIcon: Icon(Icons.book),
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
                                Crs_Ders7 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Çarşamba Ders 7',
                                prefixIcon: Icon(Icons.book),
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
                                Crs_Ders8 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Çarşamba Ders 8',
                                prefixIcon: Icon(Icons.book),
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
                                Crs_Ders9 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Çarşamba Ders 9',
                                prefixIcon: Icon(Icons.book),
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
                                Crs_Ders10 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Çarşamba Ders 10',
                                prefixIcon: Icon(Icons.book),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///Perşembe Ders programı için 10 ders texbox
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        height: 830,
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
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Perşembe',
                                style: Sabitler.baslikStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (String deger) {
                                  Prsm_Ders1 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Perşembe Ders 1',
                                  prefixIcon: Icon(Icons.book),
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
                                  Prsm_Ders2 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Perşembe Ders 2',
                                  prefixIcon: Icon(Icons.book),
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
                                  Prsm_Ders3 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Perşembe Ders 3',
                                  prefixIcon: Icon(Icons.book),
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
                                  Prsm_Ders4 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Perşembe Ders 4',
                                  prefixIcon: Icon(Icons.book),
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
                                  Prsm_Ders5 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Perşembe Ders 5',
                                  prefixIcon: Icon(Icons.book),
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
                                  Prsm_Ders6 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Perşembe Ders 6',
                                  prefixIcon: Icon(Icons.book),
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
                                  Prsm_Ders7 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Perşembe Ders 7',
                                  prefixIcon: Icon(Icons.book),
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
                                  Prsm_Ders8 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Perşembe Ders 8',
                                  prefixIcon: Icon(Icons.book),
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
                                  Prsm_Ders9 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Perşembe Ders 9',
                                  prefixIcon: Icon(Icons.book),
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
                                  Prsm_Ders10 = deger.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Perşembe Ders 10',
                                  prefixIcon: Icon(Icons.book),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      height: 830,
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
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Cuma',
                              style: Sabitler.baslikStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (String deger) {
                                Cuma_Ders1 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Cuma Ders 1',
                                prefixIcon: Icon(Icons.book),
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
                                Cuma_Ders2 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Cuma Ders 2',
                                prefixIcon: Icon(Icons.book),
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
                                Cuma_Ders3 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Cuma Ders 3',
                                prefixIcon: Icon(Icons.book),
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
                                Cuma_Ders4 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Cuma Ders 4',
                                prefixIcon: Icon(Icons.book),
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
                                Cuma_Ders5 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Cuma Ders 5',
                                prefixIcon: Icon(Icons.book),
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
                                Cuma_Ders6 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Cuma Ders 6',
                                prefixIcon: Icon(Icons.book),
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
                                Cuma_Ders7 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Cuma Ders 7',
                                prefixIcon: Icon(Icons.book),
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
                                Cuma_Ders8 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Cuma Ders 8',
                                prefixIcon: Icon(Icons.book),
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
                                Cuma_Ders9 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Cuma Ders 9',
                                prefixIcon: Icon(Icons.book),
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
                                Cuma_Ders10 = deger.toString();
                              },
                              decoration: InputDecoration(
                                labelText: 'Cuma Ders 10',
                                prefixIcon: Icon(Icons.book),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton.icon(
                        onPressed: () {
                          OgretmenEkle();
                        },
                        label: Text('Öğretmeni Sisteme Kaydet'),
                        icon: Icon(
                          Icons.save,
                          color: (Colors.green),
                        ),
                        color: Colors.red,
                        highlightColor: Colors.green,
                        highlightedBorderColor: Colors.green,
                      ),
                    ),
                  ],
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

  void OgretmenEkle() async {
    bool kayitIzin = false;

    if (Ad != '' && Soyad != '' && Parola != '' && Email != '') {
      var _usersDocuments = await _firestore.collection('ogretmen').get();
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
      if (true) {
        Map<String, dynamic> _eklenecekUser = <String, dynamic>{};
        _eklenecekUser['Bilgiler'] = {
          'ad': Ad,
          'email': Email,
          'parola': Parola,
          'soyad': Soyad,
          'ders': Ders,
          'ders programi': {
            'Monday': {
              'ders1': Pzrt_Ders1,
              'ders2': Prsm_Ders2,
              'ders3': Pzrt_Ders3,
              'ders4': Pzrt_Ders4,
              'ders5': Pzrt_Ders5,
              'ders6': Pzrt_Ders6,
              'ders7': Pzrt_Ders7,
              'ders8': Pzrt_Ders8,
              'ders9': Pzrt_Ders9,
              'ders10': Pzrt_Ders10
            },
            'Tuesday': {
              'ders1': Sali_Ders1,
              'ders2': Sali_Ders2,
              'ders3': Sali_Ders3,
              'ders4': Sali_Ders4,
              'ders5': Sali_Ders5,
              'ders6': Sali_Ders6,
              'ders7': Sali_Ders7,
              'ders8': Sali_Ders8,
              'ders9': Sali_Ders9,
              'ders10': Sali_Ders10,
            },
            'Wednesday': {
              'ders1': Crs_Ders1,
              'ders2': Crs_Ders2,
              'ders3': Crs_Ders3,
              'ders4': Crs_Ders4,
              'ders5': Crs_Ders5,
              'ders6': Crs_Ders6,
              'ders7': Crs_Ders7,
              'ders8': Crs_Ders8,
              'ders9': Crs_Ders9,
              'ders10': Crs_Ders10
            },
            'Thursday': {
              'ders1': Prsm_Ders1,
              'ders2': Prsm_Ders2,
              'ders3': Prsm_Ders3,
              'ders4': Prsm_Ders4,
              'ders5': Prsm_Ders5,
              'ders6': Prsm_Ders6,
              'ders7': Prsm_Ders7,
              'ders8': Prsm_Ders8,
              'ders9': Prsm_Ders9,
              'ders10': Prsm_Ders10
            },
            'Friday': {
              'ders1': Cuma_Ders1,
              'ders2': Cuma_Ders2,
              'ders3': Cuma_Ders3,
              'ders4': Cuma_Ders4,
              'ders5': Cuma_Ders5,
              'ders6': Cuma_Ders6,
              'ders7': Cuma_Ders7,
              'ders8': Cuma_Ders8,
              'ders9': Cuma_Ders9,
              'ders10': Cuma_Ders10,
            }
          }
        };
        await _firestore.collection('Ogretmen').add(_eklenecekUser);
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
      }
      ;
      debugPrint(kayitIzin.toString());
    }
  }
}
