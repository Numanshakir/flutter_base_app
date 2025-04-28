import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}



enum DeviceType { mobile, tab, web }

extension ContextExtension on BuildContext {
  DeviceType get deviceType {
    var width = MediaQuery.of(this).size.width;
    if (width <= 500) {
      return DeviceType.mobile;
    } else if (width > 500 && width <= 1270) {
      return DeviceType.tab;
    } else {
      return DeviceType.web;
    }
  }

  bool get isMobile => deviceType == DeviceType.mobile;

  bool get isTab => deviceType == DeviceType.tab;

  bool get isWeb => deviceType == DeviceType.web;
}
