import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ntp_odev/constants/app_constants.dart';

import 'Pages/Yetkili/Ogretmen_Page.dart';
import 'Pages/Yetkili/Yetkili_Page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoklama Alma',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: Sabitler.baslikText),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _email = '';
  String _password = '';
  String _durum = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //IDler

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              Sabitler.baslikText,
              style: Sabitler.baslikStyle,
            ),
          )),
      body: Center(
        child: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Text(
                  'Giriş Yap',
                  style: Sabitler.baslikStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Hoşgeldiniz',
                  style: Sabitler.Textbox2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (String deger) {
                    _email = deger.toString();
                  },
                  decoration: InputDecoration(
                    labelText: 'Gmail Adresi Giriniz',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  obscureText: true,
                  onChanged: (String deger) {
                    _password = deger.toString();
                  },
                  decoration: InputDecoration(
                    labelText: 'Şifre Giriniz',
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  ),
                ),
              ),
              Text(_durum),
              OutlineButton.icon(
                onPressed: () {
                  GirisYap();
                },
                label: Text('Giriş Yap'),
                icon: Icon(
                  Icons.task_alt_outlined,
                  color: (Colors.green),
                ),
                color: Colors.red,
                highlightColor: Colors.amber,
                highlightedBorderColor: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void veriEkleSet() async {
    var _yeniDocID = _firestore.collection('users').doc().id;
    await _firestore
        .doc('users/$_yeniDocID')
        .set({'isim': 'Ahmet', 'userID': _yeniDocID});
    await _firestore
        .doc('users/0ZblwCrouiPrnpVkCUmZ')
        .set({'okul ': 'MTT MTAL'}, SetOptions(merge: true));
  }

  void VeriGuncelle() async {
    await _firestore
        .doc('users/0ZblwCrouiPrnpVkCUmZ')
        .update({'adres.ilçe': 'Darıca'});
  }

  void VeriSil() async {
    await _firestore.doc('users/ZtXJVZ07LZHJlBfW1acJ').delete();
  }

  void VeriOkul() async {
    var _usersDocuments = await _firestore.collection('Yetkili').get();
    debugPrint(_usersDocuments.size.toString());
    debugPrint(_usersDocuments.docs.length.toString());

    for (var eleman in _usersDocuments.docs) {
      debugPrint('Döküman id ${eleman.id}');
      Map userMap = eleman.data();
      debugPrint(userMap['Bilgiler']['Ad'].toString());
    }

    var _beratDoc = await _firestore.doc('Yetkili/s2BPoXMDMMvKVszuCJX6').get();
    debugPrint(_beratDoc.data()!['isim'].toString());
  }

  void VeriOkuRealTime() async {
    var _userStream = _firestore.collection('Yetkili').snapshots();
    _userStream.listen((event) {
      event.docChanges.forEach((element) {
        debugPrint(element.doc.data().toString());
      });
    });
  }

  void YekiliEkleme() async {
    Map<String, dynamic> _eklenecekUser = <String, dynamic>{};
    _eklenecekUser['Bilgiler'] = {
      'Statü': 'Yetkisiz',
      'Ad': 'Ahmet',
      'email': 'alo@gmail.com',
      'parola': '123456',
      'Soyad': 'BAYRAM'
    };
    await _firestore.collection('Yetkili').add(_eklenecekUser);
  }

  void GirisYap() async {
    bool durum = false;

    var _usersDocuments = await _firestore.collection('Yetkili').get();
    debugPrint(_usersDocuments.size.toString());
    debugPrint(_usersDocuments.docs.length.toString());

    for (var eleman in _usersDocuments.docs) {
      debugPrint('Döküman id ${eleman.id}');
      Map userMap = eleman.data();
      if (_email == userMap['Bilgiler']['email']) {
        if (_password == userMap['Bilgiler']['parola']) {
          durum = true;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Yetkili()));
          setState(() {
            _durum = ('Yetkili biri giriş yaptı');
          });
        }
      }
    }

    if (durum == false) {
      var _usersDocuments = await _firestore.collection('Ogretmen').get();
      debugPrint(_usersDocuments.size.toString());
      debugPrint(_usersDocuments.docs.length.toString());

      for (var eleman in _usersDocuments.docs) {
        debugPrint('Döküman id ${eleman.id}');
        Map userMap = eleman.data();
        if (_email == userMap['Bilgiler']['email']) {
          if (_password == userMap['Bilgiler']['parola']) {
            durum = true;
            Todo.title = _email.toString();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Ogretmen()));

            setState(() {
              _durum = ('Öğretmen giriş yaptı');
            });
          }
        }
      }
    }
    if (durum == false) {
      setState(() {
        _durum = ('Girilen bilgilere sayip kullanıcı bulunamadı !!!');
      });
    }
  }

  void VeriSorgu() async {
    var _userRef = _firestore.collection('users');
    var _sonuc =
        await _userRef.where('isim', isEqualTo: 'Ahmet Yunus BAYRAM').get();

    for (var user in _sonuc.docs) {
      debugPrint(user.data().toString());
    }
  }
}

class Todo {
  static String title = '';
}
