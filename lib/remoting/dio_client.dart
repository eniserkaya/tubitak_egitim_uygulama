import 'dart:convert';

import 'package:dio/dio.dart';

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
}
