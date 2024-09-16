import 'dart:developer';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

enum PlatformOS {
  isIOS,
  isAndroid,
  web,
}

PlatformOS? getPlatform({bool ignoreEmulation = false}) {
  if (kIsWeb) {
    return PlatformOS.web;
  } else if (Platform.isIOS) {
    return PlatformOS.isIOS;
  } else if (Platform.isAndroid) {
    return PlatformOS.isAndroid;
  }
  return null;
}

Future<bool> setHighRefreshRate() async {
  try {
    if (getPlatform() == PlatformOS.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
    }
    return true;
  } catch (e) {
    String error = e.toString();
    log('Error setting high refresh rate: $error');
  }
  return false;
}
