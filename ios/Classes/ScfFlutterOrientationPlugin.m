#import "ScfFlutterOrientationPlugin.h"
#import "FlutterAppDelegate+SCFOrientation.h"

@implementation ScfFlutterOrientationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"scf_flutter_orientation"
            binaryMessenger:[registrar messenger]];
  ScfFlutterOrientationPlugin* instance = [[ScfFlutterOrientationPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString * method = call.method;
    if ([@"scf_change_orientation" isEqualToString:method]) {
      NSNumber * typeIndex = [NSNumber numberWithInt:[call.arguments[0] intValue]];
      [self change_orientation:[typeIndex intValue]];
      result(nil);
    } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)change_orientation:(int)typeIndex{
    UIInterfaceOrientation iOSOrientation;
    UIInterfaceOrientationMask appSupportOrientation;
    switch (typeIndex) {
      case 0:
      {
        appSupportOrientation = UIInterfaceOrientationMaskPortrait;
        iOSOrientation = UIInterfaceOrientationPortrait;
      }
        break;
      case 1:
      {
        appSupportOrientation = UIInterfaceOrientationMaskLandscape;
        iOSOrientation = UIInterfaceOrientationLandscapeLeft;
      }
        break;
      case 2:
      {
        appSupportOrientation = UIInterfaceOrientationMaskPortraitUpsideDown;
        iOSOrientation = UIInterfaceOrientationPortraitUpsideDown;
      }
        break;
      case 3:
      {
        appSupportOrientation = UIInterfaceOrientationMaskLandscape;
        iOSOrientation = UIInterfaceOrientationLandscapeRight;
      }
        break;
      default:
      {
        appSupportOrientation = UIInterfaceOrientationMaskAll;
        iOSOrientation = UIInterfaceOrientationUnknown;

      }
        break;
    }
    FlutterAppDelegate *delegate = (FlutterAppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.orientationMask = appSupportOrientation;
    [[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:[UIApplication sharedApplication].keyWindow];
    // 重置下屏幕方向
    NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
    // 切换到目标方向
    [[UIDevice currentDevice] setValue:@(iOSOrientation) forKey:@"orientation"];
    [UIViewController attemptRotationToDeviceOrientation];
}

@end
