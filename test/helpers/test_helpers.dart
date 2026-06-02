import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class Helper {
  static void useDesignSize(WidgetTester tester) {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }
}
