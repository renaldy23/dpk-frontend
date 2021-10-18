import 'package:dio/dio.dart';

import '../../utils/api_service.dart';
import '/app/satuan/satuan_model.dart';

class SatuanService {
  final _apiService = ApiService();

  final String _endPoint = 'satuan';

  Future<List<SatuanModel>> getListData({
    required String token,
    int skip = 0,
    int limit = 10,
  }) async {
    Response response = await _apiService.get(
        token: token,
        endPoint: '$_endPoint',
        param: '?skip=$skip&limit=$limit');

    if (response.data != null) {
      return SatuanModel.fromJsonList(response.data);
    }

    return [];
  }
}


// import 'package:dio/dio.dart';

// import '/config.dart';
// import '/app/satuan/satuan_model.dart';

// class SatuanService {
//   final Dio _dio = Dio(configDioBaseOptions());
  
  

//   Future<List<SatuanModel>> getListData(
//       {required String token, int skip = 0, int limit = 10}) async {

//     _dio.options.headers["Authorization"] = "Bearer " + token;

//     Response response = await _dio.get('satuan/?skip=$skip&limit=$limit');
//     print('Response: ');
//     print(SatuanModel.fromJsonList(response.data));

//     if (response.data != null) {
//       return SatuanModel.fromJsonList(response.data);
//     }

//     return [];
//   }
// }
