import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dev_config_method_channel.dart';

abstract class DevConfigPlatform extends PlatformInterface {
  /// Constructs a DevConfigPlatform.
  DevConfigPlatform() : super(token: _token);

  static final Object _token = Object();

  static DevConfigPlatform _instance = MethodChannelDevConfig();

  /// The default instance of [DevConfigPlatform] to use.
  ///
  /// Defaults to [MethodChannelDevConfig].
  static DevConfigPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DevConfigPlatform] when
  /// they register themselves.
  static set instance(DevConfigPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
