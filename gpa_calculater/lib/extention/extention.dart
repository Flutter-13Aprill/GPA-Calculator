import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  getWidth() {
    return MediaQuery.of(this).size.width;
  }

  gethight() {
    return MediaQuery.of(this).size.height;
  }
}
