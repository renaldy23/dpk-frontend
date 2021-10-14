import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/config.dart';
import '/app/user/user_model.dart';
import '/app/user/user_view_model.dart';

class UserService {
  final Dio _dio = Dio(configDioBaseOptions());

  // Get token
  Future<String> getToken({
    required String username,
    required String password,
  }) async {
    String token = "";
    FormData formData =
        FormData.fromMap({'username': username, 'password': password});

    try {
      Response res = await _dio
          .post(
            "users/token",
            data: formData,
          )
          .catchError((e) => throw Exception(e.toString()));
      token = res.data["access_token"];
    } catch (e) {
      print('ERROR getToken: ' + e.toString());
    }

    return token;
  }

  String getTokenString(BuildContext context) {
    final userViewModel = context.read(userViewModelProvider.notifier);
    return userViewModel.getToken;
  }

 Map<String, dynamic> getCurrentUser(BuildContext context) {
    final userViewModel = context.read(userViewModelProvider.notifier);
    String user =  userViewModel.getUser;
    return json.decode(user);
  }

  //
  Future<UserModel> getUserMe(String token) async {
    late UserModel user;

    _dio.options.headers["Authorization"] = "Bearer " + token;

    try {
      Response userData = await _dio.get('users/me');
      var data = userData.data;
      data['role'] = 1;
      data['password'] = '';
      user = UserModel.fromJson(data);
      // print(user);
    } catch (e) {
      print(e.toString());
    }

    return user;
  }

  Future<String> getUsername(String username) async {
    String email = "";

    try {
      Response userData = await _dio.get('users/username/$username');
      email = userData.data["email"];
      print(email);
    } catch (e) {
      print('ERROR: getUsername: ' + e.toString());
    }

    return email;
  }

  Future<String> getEmail(String email) async {
    String username = "";

    try {
      Response userData = await _dio.get('users/email/$email');
      username = userData.data["username"];
    } catch (e) {
      print('ERROR: getEmail: ' + e.toString());
    }

    return username;
  }

  Future<String> getRole(String username) async {
    String role = "";

    try {
      Response userData = await _dio.get('users/role/$username');
      role = userData.data["role"];
    } catch (e) {
      print('ERROR: getRole: ' + e.toString());
    }

    return role;
  }

  Future logout(BuildContext context) async {
    final userViewModel = context.read(userViewModelProvider.notifier);
    userViewModel.logout();
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/login", (Route<dynamic> route) => false);
  }

  // EOF
}
