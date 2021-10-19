import 'package:dio/dio.dart';
import 'package:dpkfrontend/app/supplier/data/supplier_model.dart';
import 'package:dpkfrontend/utils/api_service.dart';

class SupplierService {
  final _apiService = ApiService();

  final String _endPoint = 'supplier';

  Future<List<SupplierModel>> getListData({
    required String token,
    int skip = 0,
    int limit = 10,
  }) async {
    try {
      Response response = await _apiService.get(
        token: token,
        endPoint: '$_endPoint',
        param: '?skip=$skip&limit=$limit',
      );

      if (response.data != null) {
        print(response.data);
        return SupplierModel.fromJsonList(response.data);
      }
      return [];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
