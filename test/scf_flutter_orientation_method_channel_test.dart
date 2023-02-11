import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scf_flutter_orientation/scf_flutter_orientation_method_channel.dart';

void main() {
  MethodChannelScfFlutterOrientation platform = MethodChannelScfFlutterOrientation();
  const MethodChannel channel = MethodChannel('scf_flutter_orientation');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
