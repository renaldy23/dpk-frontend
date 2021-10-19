import 'package:dio/dio.dart';

import '../../utils/api_service.dart';
import '/app/merk/merk_model.dart';

class MerkService {
  final _apiService = ApiService();

  final String _endPoint = 'merk';

  Future<List<MerkModel>> getListData({
    required String token,
    int skip = 0,
    int limit = 10,
  }) async {
    Response response = await _apiService.get(
        token: token,
        endPoint: '$_endPoint',
        param: '?skip=$skip&limit=$limit');

    if (response.data != null) {
      return MerkModel.fromJsonList(response.data);
    }

    return [];
  }
}


// import 'package:dio/dio.dart';

// import '/config.dart';
// import '/app/merk/merk_model.dart';

// class MerkService {
//   final Dio _dio = Dio(configDioBaseOptions());
  
  

//   Future<List<MerkModel>> getListData(
//       {required String token, int skip = 0, int limit = 10}) async {

//     _dio.options.headers["Authorization"] = "Bearer " + token;

//     Response response = await _dio.get('merk/?skip=$skip&limit=$limit');
//     print('Response: ');
//     print(MerkModel.fromJsonList(response.data));

//     if (response.data != null) {
//       return MerkModel.fromJsonList(response.data);
//     }

//     return [];
//   }
// }
