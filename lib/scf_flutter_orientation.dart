import 'scf_flutter_orientation_platform_interface.dart';
import 'package:flutter/services.dart';

class ScfFlutterOrientation {
  static changeScreenOrientation(DeviceOrientation orientation) {
    ScfFlutterOrientationPlatform.instance.changeScreenOrientation(orientation);
  }
}
