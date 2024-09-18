import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'en.dart';
import 'it.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('it', 'IT');

  @override
  Map<String, Map<String, String>> get keys =>
      {'it_IT': itMessages, 'en_US': enMessages};
}
