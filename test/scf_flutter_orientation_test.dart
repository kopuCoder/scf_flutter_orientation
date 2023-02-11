import 'package:flutter_test/flutter_test.dart';
import 'package:scf_flutter_orientation/scf_flutter_orientation.dart';
import 'package:scf_flutter_orientation/scf_flutter_orientation_platform_interface.dart';
import 'package:scf_flutter_orientation/scf_flutter_orientation_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScfFlutterOrientationPlatform 
    with MockPlatformInterfaceMixin
    implements ScfFlutterOrientationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ScfFlutterOrientationPlatform initialPlatform = ScfFlutterOrientationPlatform.instance;

  test('$MethodChannelScfFlutterOrientation is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScfFlutterOrientation>());
  });

  test('getPlatformVersion', () async {
    ScfFlutterOrientation scfFlutterOrientationPlugin = ScfFlutterOrientation();
    MockScfFlutterOrientationPlatform fakePlatform = MockScfFlutterOrientationPlatform();
    ScfFlutterOrientationPlatform.instance = fakePlatform;
  
    expect(await scfFlutterOrientationPlugin.getPlatformVersion(), '42');
  });
}
