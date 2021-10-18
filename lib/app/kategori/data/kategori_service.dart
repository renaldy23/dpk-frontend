import 'package:dio/dio.dart';
import '/utils/api_service.dart';
import 'kategori_model.dart';

class KategoriService {
  final _apiService = ApiService();

  final String _endPoint = 'kategori';

  // List
  Future<List<KategoriModel>> getListData({
    required String token,
    // required String endPoint,
    int skip = 0,
    int limit = 10,
  }) async {
    Response response = await _apiService.get(
        token: token,
        endPoint: '$_endPoint',
        param: '?skip=$skip&limit=$limit');

    if (response.data != null) {
      return KategoriModel.fromJsonList(response.data);
    }

    return [];
  }

  
}
