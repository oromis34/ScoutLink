import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/features/dashboard/screens/dashboard.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class AppBottomNavigation extends StatelessWidget {
  AppBottomNavigation({super.key});

  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SlidingClippedNavBar(
          selectedIndex: dashboardController.currentIndex.value,
          iconSize: 30,
          activeColor: Theme.of(context).primaryColor,
          onButtonPressed: (index) => dashboardController.setIndex(index),
          barItems: <BarItem>[
            BarItem(
              icon: Icons.home,
              title: 'home_label'.tr,
            ),
            BarItem(
              icon: Icons.groups,
              title: 'group_label'.tr,
            ),
            BarItem(
              icon: Icons.calendar_month,
              title: 'calendar_label'.tr,
            ),
            BarItem(
              icon: Icons.apps,
              title: 'features_label'.tr,
            ),
          ],
        ));
  }
}
