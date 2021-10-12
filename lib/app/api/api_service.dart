import 'package:dio/dio.dart';

import '/config.dart';

class ApiService {
  final Dio _dio = Dio(configDioBaseOptions());

  Future create({
    required String token,
    required String endPoint,
    required dynamic data,
    String param = "",
  }) async {
    _dio.options.headers["Authorization"] = "Bearer " + token;

    print(endPoint);
    print(data);

    Response response = await _dio.post(
      '$endPoint/$param',
      data: data,
    );

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
}
