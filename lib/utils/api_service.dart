import 'package:dio/dio.dart';
import '/utils/api_model.dart';
import '/config.dart';

class ApiService {
  final Dio _dio = Dio(configDioBaseOptions());

  Future<ApiResponseModel> create({
    required String token,
    required String endPoint,
    required dynamic data,
    String param = "",
  }) async {
    // Init
    ApiResponseModel result = ApiResponseModel();
    Response response;

    _dio.options.headers["Authorization"] = "Bearer " + token;

    try {
      response = await _dio.post(
        '$endPoint/$param',
        data: data,
      );
      result
        ..statusCode = response.statusCode
        ..message = 'success'
        ..body = response.data.toString();
    } on DioError catch (e) {
      String errData = e.response!.data['detail'][0]['msg'];
      final startIndex = errData.indexOf("DETAIL");
      throw Exception(errData.substring(startIndex + 8));
    }

    return result;
  }

  Future<dynamic> get({
    required String token,
    required String endPoint,
    String param = "",
  }) async {
    _dio.options.headers["Authorization"] = "Bearer " + token;

    Response response = await _dio.get('$endPoint/$param');

    if (response.data != null) {
      return response;
    }

    return null;
  }

  Future<ApiResponseModel> update({
    required String token,
    required String endPoint,
    required dynamic data,
    String param = "",
  }) async {
    // Init
    ApiResponseModel result = ApiResponseModel();
    Response response;
    _dio.options.headers["Authorization"] = "Bearer " + token;

    try {
      response = await _dio.put(
        '$endPoint/$param',
        data: data,
      );
      result
        ..statusCode = response.statusCode
        ..message = 'success'
        ..body = response.data.toString();
    } on DioError catch (e) {
      String errData = e.response!.data['detail'][0]['msg'];
      final startIndex = errData.indexOf("DETAIL");
      throw Exception(errData.substring(startIndex + 8));
    }

    return result;
  }

  Future<ApiResponseModel> delete({
    required String token,
    required String endPoint,
    String param = "",
  }) async {

    // Init
    ApiResponseModel result = ApiResponseModel();
    Response response;
    _dio.options.headers["Authorization"] = "Bearer " + token;

    try {
      response = await _dio.delete('$endPoint/$param');
      result
        ..statusCode = response.statusCode
        ..message = 'success'
        ..body = response.data.toString();
    } on DioError catch (e) {
      String errData = e.response!.data['detail'][0]['msg'];
      final startIndex = errData.indexOf("DETAIL");
      throw Exception(errData.substring(startIndex + 8));
    }

    return result;
  
  }
}
