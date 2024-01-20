
import 'prod_config_platform_interface.dart';

class ProdConfig {
  Future<String?> getPlatformVersion() {
    return ProdConfigPlatform.instance.getPlatformVersion();
  }
}
