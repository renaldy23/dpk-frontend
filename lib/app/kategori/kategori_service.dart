import 'package:dio/dio.dart';

import '../../utils/api_service.dart';
import '/app/kategori/kategori_model.dart';

class KategoriService {
  final _apiService = ApiService();

  final String _endPoint = 'kategori';

  Future<List<KategoriModel>> getListData({
    required String token,
    // required String endPoint,
    int skip = 0,
    int limit = 10,
  }) async {
    Response response = await _apiService.get(
        token: token, endPoint: '$_endPoint', param: '?skip=$skip&limit=$limit');

    if (response.data != null) {
      return KategoriModel.fromJsonList(response.data);
    }

    return [];
  }
}


// import 'package:dio/dio.dart';

// import '/config.dart';
// import '/app/kategori/kategori_model.dart';

// class KategoriService {
//   final Dio _dio = Dio(configDioBaseOptions());
  
  

//   Future<List<KategoriModel>> getListData(
//       {required String token, int skip = 0, int limit = 10}) async {

//     _dio.options.headers["Authorization"] = "Bearer " + token;

//     Response response = await _dio.get('kategori/?skip=$skip&limit=$limit');
//     print('Response: ');
//     print(KategoriModel.fromJsonList(response.data));

//     if (response.data != null) {
//       return KategoriModel.fromJsonList(response.data);
//     }

//     return [];
//   }
// }
