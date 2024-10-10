import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/features/auth/services/auth_service.dart';
import 'package:scout_link/features/dashboard/models/feature.dart';
import 'package:scout_link/widgets/scrollable_header_page.dart';

import '../widgets/feature_card.dart';

class FeaturesScreen extends StatelessWidget {
  FeaturesScreen({super.key});

  final AuthService authService = Get.find<AuthService>();

  // TODO: Move features in a state?
  final List<Feature> features = [
    Feature(
        title: 'Map',
        icon: Icons.map,
        description: "Specialties",
        path: "/map",
        color: Colors.blue,
        flex: 1),
    Feature(
        title: 'Specialties',
        icon: Icons.workspaces,
        description: "Specialties",
        path: "/specialties",
        color: Colors.purple,
        flex: .5),
    Feature(
        title: 'Profile',
        icon: Icons.person,
        description: "Specialties",
        path: "/profile",
        color: Colors.orange,
        flex: .5),
    Feature(
        title: 'Settings',
        icon: Icons.settings,
        description: "Specialties",
        path: "/settings",
        color: Colors.grey,
        flex: .33),
    Feature(
        title: 'Notifications',
        icon: Icons.notifications,
        description: "Specialties",
        path: "/notifications",
        color: Colors.yellow,
        flex: .33),
    Feature(
        title: 'Logout',
        icon: Icons.logout,
        action: () => {Get.find<AuthService>().logout()},
        color: Colors.red,
        flex: .33),
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollableHeaderPage(
      title: "features_label".tr,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double totalWidth = constraints.maxWidth;
            return Wrap(
              runAlignment: WrapAlignment.spaceBetween,
              runSpacing: 16.0, // Spaziatura verticale tra le card
              alignment: WrapAlignment.center,
              children: features.map((feature) {
                double cardWidth = (totalWidth - 0) *
                    feature.flex; // Calcola la larghezza di ogni card
                return SizedBox(
                  height: 130,
                  width: cardWidth, // Imposta la larghezza di ogni card
                  child: FeatureCard(
                    feature: feature,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
