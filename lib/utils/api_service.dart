import 'package:dio/dio.dart';

import '/config.dart';

class ApiService {
  final Dio _dio = Dio(configDioBaseOptions());

  // String getToken() {

  // }

  Future<int?> create({
    required String token,
    required String endPoint,
    required dynamic data,
    String param = "",
  }) async {
    _dio.options.headers["Authorization"] = "Bearer " + token;

    // print(endPoint);
    // print(data);

    Response response = await _dio.post(
      '$endPoint/$param',
      data: data,
    );

    print('Status code $response.statusCode');

    if (response.statusCode == 201) {
      print('Created');
    } else {
      print('Fail...');
    }

    return response.statusCode;
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

  Future<int?> update({
    required String token,
    required String endPoint,
    required dynamic data,
    String param = "",
  }) async {
    _dio.options.headers["Authorization"] = "Bearer " + token;

    // print(endPoint);
    // print(data);

    Response response = await _dio.put(
      '$endPoint/$param',
      data: data,
    );

    print('Status code $response.statusCode');

    if (response.statusCode == 200) {
      print('Updated');
    } else {
      print('Fail...');
    }

    return response.statusCode;
  }

  Future<dynamic> delete({
    required String token,
    required String endPoint,
    String param = "",
  }) async {
    _dio.options.headers["Authorization"] = "Bearer " + token;

    Response response = await _dio.delete('$endPoint/$param');

    if (response.data != null) {
      var data = response.data;
      if (data['code'] != 200) {
        print('Error');
        print(data);
      }
    }

    return null;
  }
}
