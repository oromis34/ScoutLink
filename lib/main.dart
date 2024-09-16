import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scout_link/settings/settings.dart';
import 'package:scout_link/utils/custom_delayed_curve.dart';
import 'package:scout_link/utils/functions.dart';
import 'package:flutter/foundation.dart';
import 'package:scout_link/utils/on_app_resume.dart';

// Requires hot restart when changed
bool enableDevicePreview = true && kDebugMode;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setHighRefreshRate();
  await initializeSettings();

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
      themeAnimationDuration: Duration(milliseconds: 400),
      themeAnimationCurve: CustomDelayedCurve(),
      key: ValueKey('ScoutLink'),
      title: "ScoutLink",
      home: Stack(
        children: [
          Row(
            children: [
              // NavigationSidebar(),
              Expanded(
                  child: Stack(
                children: [
                  // InitialPageRouteNavigator(),
                  // GlobalSnackbar(key: snackbarKey),
                ],
              )),
            ],
          ),
          // EnableSignInWithGoogleFlyIn(),
          // GlobalLoadingIndeterminate(key: loadingIndeterminateKey),
          // GlobalLoadingProgress(key: loadingProgressKey),
        ],
      ),
      builder: (context, child) {
        if (kReleaseMode) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return Container(color: Colors.transparent);
          };
        }

        Widget mainWidget = OnAppResume(
          updateGlobalAppLifecycleState: true,
          onAppResume: () async {
            await setHighRefreshRate();
          },
          child: child ?? SizedBox.shrink(),
        );

        return mainWidget;
      },
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
