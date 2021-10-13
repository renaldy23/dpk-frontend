import 'package:dio/dio.dart';

import '/config.dart';

class ApiService {
  final Dio _dio = Dio(configDioBaseOptions());

  // String getToken() {

  // }

  Future create({
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
