import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scout_link/functions.dart';
import 'package:flutter/foundation.dart';

// Requires hot restart when changed
bool enableDevicePreview = true && kDebugMode;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setHighRefreshRate();

  runApp(
    DevicePreview(
      enabled: enableDevicePreview,
      builder: (context) => EasyLocalization(
          supportedLocales: const [Locale('it'), Locale('en')],
          path: 'assets/translations',
          useFallbackTranslations: true,
          fallbackLocale: const Locale('it'),
          useOnlyLangCode: false,
          startLocale: Locale("it"),
          assetLoader: RootBundleAssetLoaderCustomLocaleLoader(),
          child: InitializeApp(key: appStateKey)),
    ),
  );
}

GlobalKey<_InitializeAppState> appStateKey = GlobalKey();

class InitializeApp extends StatefulWidget {
  InitializeApp({super.key});

  @override
  State<InitializeApp> createState() => _InitializeAppState();
}

class _InitializeAppState extends State<InitializeApp> {
  void refreshAppState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MainApp(key: ValueKey("Main App"));
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("Context Locale: " + context.locale.toString());
    log("Device Locale: " + DevicePreview.locale(context).toString());

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale:
          enableDevicePreview ? DevicePreview.locale(context) : context.locale,
      home: Scaffold(
        body: Center(
          child: Column(children: [Text('about'.tr())]),
        ),
      ),
    );
  }
}

class RootBundleAssetLoaderCustomLocaleLoader extends RootBundleAssetLoader {
  const RootBundleAssetLoaderCustomLocaleLoader();

  @override
  String getLocalePath(String basePath, Locale locale) {
    log("Initial Locale: " + locale.toString());

    // We only support the language code right now
    // This implements EasyLocalization( useOnlyLangCode: true ... )
    locale = Locale(locale.languageCode);

    log("Set Locale: " + locale.toString());

    return '$basePath/${locale.toStringWithSeparator(separator: "-")}.json';
  }
}
