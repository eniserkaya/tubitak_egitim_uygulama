import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil? _storageUtil;
  static SharedPreferences? _sharedPreferences;

  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var storage = StorageUtil._();
      await storage._init();
      _storageUtil = storage;
    }
    return _storageUtil!;
  }
  // Cannot be called from outside of this file.
  //
  StorageUtil._(); //is the named private constructor
  Future _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  // get string
  static String getString(String key, {String defValue = ''}) {
    if (_sharedPreferences == null) return defValue;
    return _sharedPreferences!.getString(key) ?? defValue;
  }
  // put string
  static Future<bool> putString(String key, String value) {
    if (_sharedPreferences == null) return Future.value(false);
    return _sharedPreferences!.setString(key, value);
  }
  // get bool
  static bool getBool(String key, {bool defValue = false}) {
    if (_sharedPreferences == null) return false;
    return _sharedPreferences!.getBool(key) ?? defValue;
  }
  // put bool
  static Future<bool> putBool(String key, bool value) {
    if (_sharedPreferences == null) return Future.value(false);
    return _sharedPreferences!.setBool(key, value);
  }
}
