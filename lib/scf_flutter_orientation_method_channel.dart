import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'scf_flutter_orientation_platform_interface.dart';

/// An implementation of [ScfFlutterOrientationPlatform] that uses method channels.
class MethodChannelScfFlutterOrientation extends ScfFlutterOrientationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('scf_flutter_orientation');

  /// 改变屏幕方向*/
  @override
  void changeScreenOrientation(DeviceOrientation orientation) {
    // ignore: constant_identifier_names
    const String METHOD_CHANGE_ORIENTATION = "scf_change_orientation";
    SystemChrome.setPreferredOrientations([orientation]);
    if (Platform.isIOS) {
      methodChannel
          .invokeMethod(METHOD_CHANGE_ORIENTATION, [(orientation.index)]);
      return;
    }

    if (Platform.isAndroid) {
      // 安卓端

    }
  }
}
