import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/features/auth/services/auth_service.dart';
import 'package:scout_link/features/dashboard/widgets/dashboard_drawer_header.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.find<AuthService>();

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DashboardDrawerHeader(),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Favourites'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.workspaces),
              title: Text('Workflow'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Updates'),
              onTap: () {},
            ),
            const Divider(
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text('Notifications'),
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
