import 'package:flutter/material.dart';

void main() {
  runApp(EgitimUygulamasi());
}
class EgitimUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Tübitak Eğitim',
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
