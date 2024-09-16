Future<Map<String, dynamic>> getDefaultPreferences() async {
  return {
    "hasOnboarded": false,
    "numLogins": 0,
    "appOpenedHour": DateTime.now().hour,
    "appOpenedMinute": DateTime.now().minute,
  };
}
