import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/utils/shared_preferences/shared_preferences.dart';

final userViewModelProvider = StateNotifierProvider<UserViewModel, bool>((ref) {
  final sharedPrefService = ref.watch(sharedPrefProvider);

  return UserViewModel(sharedPrefService);
});

class UserViewModel extends StateNotifier<bool> {
  UserViewModel(this.sharedPrefService)
      : super(sharedPrefService.getBool(_key + "auth"));
  final SharedPrefService sharedPrefService;

  static final String _key = "user";

  void setUser(value) {
    sharedPrefService.setString(_key, json.encode(value));
    // state = json.encode(value);
  }

  // String get getUser => json.decode(state);
  String get getUser => sharedPrefService.getString(_key);

  Map<String, dynamic> mapUser() =>
      json.decode(sharedPrefService.getString(_key));

  void logout() {
    sharedPrefService.delete(_key);
    sharedPrefService.delete(_key + "token");
    sharedPrefService.delete(_key + "auth");
    state = false;
  }

  // Token

  void setToken(String value) =>
      sharedPrefService.setString(_key + "token", value);
  String get getToken => sharedPrefService.getString(_key + "token");

  void setAuth(bool value) {
    sharedPrefService.setBool(_key + "auth", value);
    state = value;
  }

  bool get getAuth => sharedPrefService.getBool(_key + "auth");

  void setRole(String value) =>
      sharedPrefService.setString(_key + "role", value);
  String get getRole => sharedPrefService.getString(_key + "role");
}

// // Auth Change
// final userAuthChangesProvider =
//     StateNotifierProvider((ref) => UserAuthChanges());

// class UserAuthChanges extends StateNotifier<bool> {
//   UserAuthChanges() : super(false);

//   bool authChanges(bool value) => state = value;
// }