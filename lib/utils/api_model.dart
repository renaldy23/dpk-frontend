class ApiResponseModel {
  int? statusCode; // 200 - OK, 201 - Create, 40x - Error
  String? message;
  String? body;

  ApiResponseModel({
    this.statusCode,
    this.message,
    this.body,
  });
}
