import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'scf_flutter_orientation_method_channel.dart';
import 'package:flutter/services.dart';

abstract class ScfFlutterOrientationPlatform extends PlatformInterface {
  /// Constructs a ScfFlutterOrientationPlatform.
  ScfFlutterOrientationPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScfFlutterOrientationPlatform _instance = MethodChannelScfFlutterOrientation();

  /// The default instance of [ScfFlutterOrientationPlatform] to use.
  ///
  /// Defaults to [MethodChannelScfFlutterOrientation].
  static ScfFlutterOrientationPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScfFlutterOrientationPlatform] when
  /// they register themselves.
  static set instance(ScfFlutterOrientationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
  void changeScreenOrientation(DeviceOrientation orientation) {
    throw UnimplementedError('changeScreenOrientation has not been implemented.');
  }

}
