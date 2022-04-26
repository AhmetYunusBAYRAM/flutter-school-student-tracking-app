import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntp_odev/Pages/Yetkili/Defter_Page.dart';
import 'package:ntp_odev/Pages/Yetkili/Ogrenci_Ekle.dart';
import 'package:ntp_odev/Pages/Yetkili/Ogrenci_Ekle_Page.dart';
import 'package:ntp_odev/Pages/Yetkili/Ogretmen_Ekle_.dart';
import 'package:ntp_odev/Pages/Yetkili/Yetkili_Ekle_Page.dart';

import '../../constants/app_constants.dart';

class Yetkili extends StatelessWidget {
  const Yetkili({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            'Yetkili Paneli',
            style: Sabitler.baslikStyle,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: (Center(
          child: Container(
            height: 300,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Yetkili İşlem Paneli',
                            style: Sabitler.baslikStyle),
                      ),
                      OutlineButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Defter()));
                        },
                        label: Text('Yokalama Defteri'),
                        icon: Icon(
                          Icons.book_outlined,
                          color: (Colors.amber),
                        ),
                        color: Colors.red,
                        highlightColor: Colors.amber,
                        highlightedBorderColor: Colors.amber,
                      ),
                      OutlineButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => YetkiliEklemePanel()));
                        },
                        label: Text('Yetkili Ekle Veya Sil'),
                        icon: Icon(
                          Icons.admin_panel_settings,
                          color: (Colors.amber),
                        ),
                        color: Colors.red,
                        highlightColor: Colors.amber,
                        highlightedBorderColor: Colors.amber,
                      ),
                      OutlineButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Ogretmen_Ekle()));
                        },
                        label: Text('Öğretmen Ekle Veya Sil'),
                        icon: Icon(
                          Icons.person_add_alt_sharp,
                          color: (Colors.amber),
                        ),
                        color: Colors.red,
                        highlightColor: Colors.amber,
                        highlightedBorderColor: Colors.amber,
                      ),
                      OutlineButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Ogrenci_Ekle()));
                        },
                        label: Text('Öğrenci Ekle Veya Sil'),
                        icon: Icon(
                          Icons.person_add_alt_sharp,
                          color: (Colors.amber),
                        ),
                        color: Colors.red,
                        highlightColor: Colors.amber,
                        highlightedBorderColor: Colors.amber,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
