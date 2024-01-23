
import 'package:flutter/material.dart';

extension IntExtensions on int {
  Widget spaceWidth() {
    return SizedBox(
      width: toDouble(),
    );
  }
  Widget spaceHeight() {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget divide({double thickness = 1}) {
    return Divider(
      color: Colors.black26,
      thickness: thickness,
      height: toDouble(),
    );
  }
}

extension DoubleExtensions on double {
  Widget spaceWidth() {
    return SizedBox(
      width: this,
    );
  }

  Widget divide({double thickness = 1}) {
    return Divider(
      height: toDouble(),
      thickness: thickness,
    );
  }

  Widget spaceHeight() {
    return SizedBox(
      height: this,
    );
  }
}
