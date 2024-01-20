
import 'dev_config_platform_interface.dart';

class DevConfig {
  Future<String?> getPlatformVersion() {
    return DevConfigPlatform.instance.getPlatformVersion();
  }
}
