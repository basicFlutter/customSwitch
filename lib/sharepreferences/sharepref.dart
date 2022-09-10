
import 'package:shared_preferences/shared_preferences.dart';

class SharePref{

  static save(String key , dynamic value) async{
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPrefs.setBool(key, value);
    } else if (value is String) {
      sharedPrefs.setString(key, value);
    } else if (value is int) {
      sharedPrefs.setInt(key, value);
    } else if (value is double) {
      sharedPrefs.setDouble(key, value);
    } else if (value is List<String>) {
      sharedPrefs.setStringList(key, value);
    }
  }

  static Future<bool> saveString(String key , String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString(key, value);
    return result;
  }


  static Future<bool> saveInt(String key , int value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setInt(key, value);
    return result;
  }



  static Future<bool> saveBool(String key , bool value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   final result = await prefs.setBool(key, value);
   return result;
  }

  static Future<String> getString(String key ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     String stringValue = prefs.getString(key) ?? "empty";
    return stringValue;
  }

  static Future<int> getInt(String key ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int intValue =  prefs.getInt(key) ?? 0;
    return intValue;
  }

  static Future<bool> getBool(String key ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool(key) ?? false;
    return boolValue;
  }



}