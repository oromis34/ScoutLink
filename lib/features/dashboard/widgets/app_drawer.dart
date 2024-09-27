import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/features/auth/services/auth_service.dart';
import 'package:scout_link/features/dashboard/widgets/app_drawer_header.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.find<AuthService>();

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('home_label'.tr),
              onTap: () {
                Get.toNamed("/");
              },
            ),
            ListTile(
              leading: Icon(Icons.workspaces),
              title: Text('specialities_label'.tr),
              onTap: () {
                Get.toNamed("/specialties");
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('map_label'.tr),
              onTap: () {
                Get.toNamed("/map");
              },
            ),
            const Divider(
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text('notifications_label'.tr),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('settings_label'.tr),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('appinfo_label'.tr),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('logout_label'.tr),
              onTap: () {
                authService.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
