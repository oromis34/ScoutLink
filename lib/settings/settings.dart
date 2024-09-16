import 'dart:convert';

import 'package:scout_link/settings/default_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> appStateSettings = {};

Future<bool> initializeSettings() async {
  appStateSettings = await getDefaultPreferences();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  appStateSettings =
      json.decode(sharedPreferences.getString("userSettings") ?? "{}");

  if (appStateSettings["hasOnboarded"] == true) {
    appStateSettings["numLogins"] = appStateSettings["numLogins"] + 1;
  }

  appStateSettings["appOpenedHour"] = DateTime.now().hour;
  appStateSettings["appOpenedMinute"] = DateTime.now().minute;

  // save settings
  await sharedPreferences.setString(
      "userSettings", json.encode(appStateSettings));

  return true;
}
