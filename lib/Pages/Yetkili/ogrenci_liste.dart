import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OgrenciListe extends StatelessWidget {
  const OgrenciListe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: ((context, index) {
          return Card(
            child: ListTile(
              title: Text('Ahmet Yunus BAYRAM'),
            ),
          );
        }));
  }
}
