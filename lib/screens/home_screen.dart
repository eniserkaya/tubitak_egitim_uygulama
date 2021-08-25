import 'package:flutter/material.dart';
import 'package:tubitak_egitim_uygulama/models/kullanici.dart';
import 'package:tubitak_egitim_uygulama/remoting/dio_client.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
              future: DioClient().gezilenYerleriGetir(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Bir sorun var...');
                  } else {
                    Kullanici kullanici = snapshot.data as Kullanici;
                    print(kullanici.ad);
                    // Home Ekrani Tasarlanacak.
                  }
                }
                return Text('');
              }),
        ),
      ),
    );
  }
}
