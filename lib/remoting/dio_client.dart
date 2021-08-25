import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tubitak_egitim_uygulama/models/kullanici.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: 'https://www.eniserkaya.com/tutorials/flutter',
      connectTimeout: 5000,
      receiveTimeout: 3000));

  Future<bool?> girisYapmaIstegiGonder(FormData data) async {
    bool? girisYaptiMi;

    try {
      Response response = await _dio.post(
        '/login.php',
        data: data,
      );

      print('Kullanıcı giriş sonucu: ${response.data}');

      girisYaptiMi = json.decode(response.data)['sonuc'];
    } catch (e) {
      print('Error kullanici girisi: $e');
    }

    return girisYaptiMi;
  }

  Future<Kullanici?> gezilenYerleriGetir() async {
    try {
      Response response = await _dio.get('/json_parser.php');
      var jsonResult = json.decode(response.data);
      return Kullanici.fromJson(jsonResult);
    } catch (e) {
      print('Error gezilen yerler: $e');
    }
  }
}
