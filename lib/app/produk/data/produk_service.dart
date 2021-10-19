import 'package:dio/dio.dart';

import '../../../utils/api_service.dart';
import '/app/produk/data/produk_model.dart';

class ProdukService {
  final _apiService = ApiService();

  final String _endPoint = 'produk';

  Future<List<ProdukModel>> getListData({
    required String token,
    int skip = 0,
    int limit = 10,
  }) async {
    Response response = await _apiService.get(
        token: token,
        endPoint: '$_endPoint',
        param: '?skip=$skip&limit=$limit');

    if (response.data != null) {
      return ProdukModel.fromJsonList(response.data);
    }

    return [];
  }
}
