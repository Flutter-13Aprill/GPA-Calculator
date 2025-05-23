import 'package:flutter/material.dart';

// An extension on BuildContext to easily get screen height and width with an optional scaling factor.
extension ScreenSize on BuildContext {
  getHeight({double factor = 1}) {
    return MediaQuery.sizeOf(this).height * factor;
  }

  getWidth({double factor = 1}) {
    return MediaQuery.sizeOf(this).width * factor;
  }
}
