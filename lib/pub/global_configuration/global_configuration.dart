import 'package:global_configuration/global_configuration.dart';

class GlobalConfig {
  final GlobalConfiguration _cfg = new GlobalConfiguration();

  dynamic get(String key) {
    dynamic value;
    try {
      value = _cfg.get(key);
    } catch (e) {
      print(e.toString());
    }
    return value;
  }
}
