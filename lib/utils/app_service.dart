import '/app/user/user_model.dart';
import '/app/user/user_service.dart';
import '/utils/app_model.dart';
import 'package:flutter/material.dart';

class AppService<T> {
  final _userService = UserService();

  AppModel initState({
    required BuildContext context,
    required String title,
    required String apiEndPoint,
    bool updateForm = false,
  }) {
    AppModel appModel = AppModel(
        title: title, apiEndPoint: apiEndPoint, updateForm: updateForm);

    // Get token
    appModel.token = _userService.getTokenString(context);
    // Get user info
    appModel.userModel =
        UserModel.fromJson(_userService.getCurrentUser(context));

    return appModel;
  }

  Future<List<T>> getListData(service, String token) async {
    List<T> results = [];
    await service
        .getListData(token: token)
        .then((value) => value.forEach((element) => results.add(element)));
    return results;
  }
}
