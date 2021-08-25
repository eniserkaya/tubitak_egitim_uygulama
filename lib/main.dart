import 'package:flutter/material.dart';
import 'package:tubitak_egitim_uygulama/router.dart';
import 'package:tubitak_egitim_uygulama/util/routing_constants.dart';
import 'package:tubitak_egitim_uygulama/util/storage_util.dart';

Future<void> main() async {
  //Flutter runApp çalıştırmadan önce native code çalıştırmak istiyorsa, bu method kullanılır.
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.getInstance();
  bool girisYaptiMi = StorageUtil.getBool("kullaniciGirisYaptiMi",defValue: false);

  runApp(EgitimUygulamasi(girisYaptiMi));
}
class EgitimUygulamasi extends StatelessWidget {

  bool girisYaptiMi;

  EgitimUygulamasi(this.girisYaptiMi);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title:'Tübitak Eğitim',
      onGenerateRoute: TubitakRouter.generateRoute,
      initialRoute: girisYaptiMi ? HomeScreenRoute : LoginScreenRoute,
      theme: ThemeData(
        primaryColor: Colors.grey[900]
      ),
    );
  }
}
