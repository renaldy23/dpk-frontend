import 'package:dio/dio.dart';

import '/app/api/api_service.dart';
import '/app/kategori_berat/kategori_berat_model.dart';

class KategoriBeratService {
  final _apiService = ApiService();

  final String _endPoint = 'kategori-berat';

  Future<List<KategoriBeratModel>> getListData({
    required String token,
    // required String endPoint,
    int skip = 0,
    int limit = 10,
  }) async {
    Response response = await _apiService.get(
        token: token, endPoint: '$_endPoint', param: '?skip=$skip&limit=$limit');

    if (response.data != null) {
      return KategoriBeratModel.fromJsonList(response.data);
    }

    return [];
  }
}
