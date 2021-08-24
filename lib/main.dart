import 'package:flutter/material.dart';
import 'package:tubitak_egitim_uygulama/router.dart';
import 'package:tubitak_egitim_uygulama/util/routing_constants.dart';

void main() {
  runApp(EgitimUygulamasi());
}
class EgitimUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Tübitak Eğitim',
      onGenerateRoute: TubitakRouter.generateRoute,
      initialRoute: HomeScreenRoute,
    );
  }
}
