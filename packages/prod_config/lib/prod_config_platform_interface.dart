import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'prod_config_method_channel.dart';

abstract class ProdConfigPlatform extends PlatformInterface {
  /// Constructs a ProdConfigPlatform.
  ProdConfigPlatform() : super(token: _token);

  static final Object _token = Object();

  static ProdConfigPlatform _instance = MethodChannelProdConfig();

  /// The default instance of [ProdConfigPlatform] to use.
  ///
  /// Defaults to [MethodChannelProdConfig].
  static ProdConfigPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ProdConfigPlatform] when
  /// they register themselves.
  static set instance(ProdConfigPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
