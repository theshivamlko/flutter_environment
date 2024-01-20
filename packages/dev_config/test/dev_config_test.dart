import 'package:flutter_test/flutter_test.dart';
import 'package:dev_config/dev_config.dart';
import 'package:dev_config/dev_config_platform_interface.dart';
import 'package:dev_config/dev_config_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDevConfigPlatform
    with MockPlatformInterfaceMixin
    implements DevConfigPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DevConfigPlatform initialPlatform = DevConfigPlatform.instance;

  test('$MethodChannelDevConfig is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDevConfig>());
  });

  test('getPlatformVersion', () async {
    DevConfig devConfigPlugin = DevConfig();
    MockDevConfigPlatform fakePlatform = MockDevConfigPlatform();
    DevConfigPlatform.instance = fakePlatform;

    expect(await devConfigPlugin.getPlatformVersion(), '42');
  });
}
