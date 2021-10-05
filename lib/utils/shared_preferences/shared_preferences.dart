import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Shared Preferences
final sharedPrefProvider = Provider<SharedPrefService>((ref) => throw UnimplementedError());

class SharedPrefService {
  SharedPrefService(this.sharedPref);
  final SharedPreferences sharedPref;

  // Bool
  Future<void> setBool(String key, bool value) async =>
      await sharedPref.setBool(key, value);
  bool getBool(String key) => sharedPref.getBool(key) ?? false;

  // String
  Future<void> setString(String key, String value) async =>
      await sharedPref.setString(key, value);
  String getString(String key) => sharedPref.getString(key) ?? "";
  
  Future<void> delete(String key) async => await sharedPref.remove(key);
  
}
