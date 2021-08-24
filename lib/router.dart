import 'package:flutter/material.dart';
import 'package:tubitak_egitim_uygulama/screens/home_screen.dart';
import 'package:tubitak_egitim_uygulama/screens/login_screen.dart';
import 'package:tubitak_egitim_uygulama/screens/profile_screen.dart';

class TubitakRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case 'login':
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case 'profile':
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text('Böyle bir sayfa yok.'),
              ),
            ));
    }
  }
}