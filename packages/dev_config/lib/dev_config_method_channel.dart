import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dev_config_platform_interface.dart';

/// An implementation of [DevConfigPlatform] that uses method channels.
class MethodChannelDevConfig extends DevConfigPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dev_config');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
