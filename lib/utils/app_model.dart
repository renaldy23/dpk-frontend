import '/app/user/user_model.dart';

class AppModel {
  String? title;
  String? token;
  String? apiEndPoint;
  UserModel? userModel;
  bool? updateForm;

  AppModel(
      {this.title,
      this.token,
      this.apiEndPoint,
      this.userModel,
      this.updateForm});
}
