import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:scout_link/features/calendar/screens/calendar_screen.dart';
import 'package:scout_link/features/dashboard/screens/features_screen.dart';
import 'package:scout_link/features/dashboard/widgets/app_bottom_navigation.dart';
import 'package:scout_link/features/group/screens/group_screen.dart';
import 'package:scout_link/features/home/screens/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<Widget> _widgetList = <Widget>[
    HomeScreen(),
    GroupScreen(),
    CalendarScreen(),
    FeaturesScreen()
  ];

  final Logger logger = Logger();

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: dashboardController.pageController,
        children: _widgetList,
      ),
      bottomNavigationBar: AppBottomNavigation(),
    );
  }
}

class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  void setIndex(int index) {
    currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
