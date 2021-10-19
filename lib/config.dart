import 'package:dio/dio.dart';
import '/pub/global_configuration/global_configuration.dart';

class Config {
  final _cfg = GlobalConfig();

  // Environent
  bool get isDev => _cfg.get('isDev') == "True" ? true : false;
  bool get isEmulator => _cfg.get('isEmulator') == "True" ? true : false;

  // Assets
  String get assetImage => _cfg.get("assetImage");

  // API
  String get apiBaseUrl {
    String baseUrl = "";
    if (isDev) if (isEmulator)
      baseUrl = _cfg.get("apiBaseUrlEmulator");
    else
      baseUrl = _cfg.get("apiBaseUrlDev");
    else
      baseUrl = _cfg.get("apiBaseUrlProd");

    return baseUrl;
  }

  // DIO
  // BaseOptions dioBaseOptions() => BaseOptions(
  //   baseUrl: apiBaseUrl,
  //   connectTimeout: 5000,
  //   receiveTimeout: 3000,
  // );

}

BaseOptions configDioBaseOptions() => BaseOptions(
      baseUrl: Config().apiBaseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
