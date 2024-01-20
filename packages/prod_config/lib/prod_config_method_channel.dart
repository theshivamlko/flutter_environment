import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'prod_config_platform_interface.dart';

/// An implementation of [ProdConfigPlatform] that uses method channels.
class MethodChannelProdConfig extends ProdConfigPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('prod_config');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
