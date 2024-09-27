import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/features/auth/services/auth_service.dart';
import 'package:scout_link/features/dashboard/models/feature.dart';
import 'package:scout_link/features/specialties/screens/specialties_screen.dart';

class FeaturesScreen extends StatelessWidget {
  FeaturesScreen({super.key});

  final AuthService authService = Get.find<AuthService>();

  // TODO: Move features in a state?
  final List<Feature> features = [
    Feature(
        title: 'Specialties',
        icon: Icons.person,
        description: "Specialties",
        path: "/specialties"),
    Feature(
        title: 'Map',
        icon: Icons.person,
        description: "Specialties",
        path: "/map"),
    Feature(
        title: 'Profile',
        icon: Icons.person,
        description: "Specialties",
        path: "/profile"),
    Feature(
        title: 'Settings',
        icon: Icons.settings,
        description: "Specialties",
        path: "/settings"),
    Feature(
        title: 'Notifications',
        icon: Icons.notifications,
        description: "Specialties",
        path: "/notifications"),
    Feature(
      title: 'Logout',
      icon: Icons.logout,
      action: () => {Get.find<AuthService>().logout()},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Features'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: features.length,
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () {
            if (features[i].action != null) {
              features[i].action!();
            } else if (features[i].path != null) {
              Get.toNamed(features[i].path!);
            }
          },
          child: Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  features[i].icon,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text(
                  features[i].title,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
