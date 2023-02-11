import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:scf_flutter_orientation/scf_flutter_orientation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _platformVersion = 'Unknown';
  final _scfFlutterOrientationPlugin = ScfFlutterOrientation();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('scf_flutter_orientation样例'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Container(
              color: Colors.teal.shade200,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    child: const Text('横屏切换'),
                    onPressed: () {
                      print("====>横屏切换<====");
                      ScfFlutterOrientation.changeScreenOrientation(
                          DeviceOrientation.landscapeRight);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('竖屏切换'),
                    onPressed: () {
                      print("====>竖屏切换<====");
                      ScfFlutterOrientation.changeScreenOrientation(
                          DeviceOrientation.portraitUp);
                    },
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
