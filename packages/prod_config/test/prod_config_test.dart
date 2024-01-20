import 'package:flutter_test/flutter_test.dart';
import 'package:prod_config/prod_config.dart';
import 'package:prod_config/prod_config_platform_interface.dart';
import 'package:prod_config/prod_config_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockProdConfigPlatform
    with MockPlatformInterfaceMixin
    implements ProdConfigPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ProdConfigPlatform initialPlatform = ProdConfigPlatform.instance;

  test('$MethodChannelProdConfig is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelProdConfig>());
  });

  test('getPlatformVersion', () async {
    ProdConfig prodConfigPlugin = ProdConfig();
    MockProdConfigPlatform fakePlatform = MockProdConfigPlatform();
    ProdConfigPlatform.instance = fakePlatform;

    expect(await prodConfigPlugin.getPlatformVersion(), '42');
  });
}
