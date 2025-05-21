import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  getHight({double pre = 1}) {
    return MediaQuery.sizeOf(this).height * pre;
  }

  getWight({double pre = 1}) {
    return MediaQuery.sizeOf(this).width * pre;
  }
}
