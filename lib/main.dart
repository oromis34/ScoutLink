import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/features/auth/services/auth_service.dart';
import 'package:scout_link/routes/page_not_found.dart';
import 'package:scout_link/routes/router.dart';
import 'package:scout_link/settings/settings.dart';
import 'package:scout_link/translations/translation_service.dart';
import 'package:scout_link/utils/functions.dart';
import 'package:flutter/foundation.dart';
import 'package:scout_link/utils/on_app_resume.dart';

// Requires hot restart when changed
bool enableDevicePreview = false && kDebugMode;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setHighRefreshRate();
  await initializeSettings();

  Client client = Client()
    .setEndpoint('http://scoutlink.volcanixduo.com/v1') // Your Appwrite Endpoint
    .setProject('6708dc01002fdf59aac7');

  await Get.putAsync(() => AuthService(client).init());

  runApp(
    DevicePreview(
      enabled: enableDevicePreview,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "ScoutLink",
      key: ValueKey('ScoutLink'),
      unknownRoute: GetPage(name: '/notfound', page: () => PageNotFound()),
      initialRoute: '/',
      getPages: routes,
      translations: TranslationService(),
      locale: TranslationService.locale,
      fallbackLocale:
          TranslationService.fallbackLocale, // specify the fallback locale
      enableLog: true,
      defaultTransition: Transition.native,
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: 'Roboto',
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
