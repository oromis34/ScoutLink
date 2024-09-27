import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:scout_link/features/calendar/screens/calendar_screen.dart';
import 'package:scout_link/features/dashboard/widgets/app_drawer.dart';
import 'package:scout_link/features/group/screens/group_screen.dart';
import 'package:scout_link/features/home/screens/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    GroupScreen(),
    CalendarScreen(),
  ];

  final List<String> _widgetTitles = <String>[
    "home_label".tr,
    "group_label".tr,
    "calendar_label".tr,
  ];

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();

    final dashboardController = Get.put(DashboardController());

    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(
              _widgetTitles.elementAt(dashboardController.currentIndex.value))),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                print('Search button');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
              onPressed: () {
                print('Filter button');
              },
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: Center(
          child: Obx(() =>
              _widgetOptions.elementAt(dashboardController.currentIndex.value)),
        ),
        bottomNavigationBar: Obx(
          () => NavigationBar(
            onDestinationSelected: (int index) {
              logger.i('Tapped on $index');
              dashboardController.setIndex(index);
            },
            indicatorColor: Colors.amber,
            selectedIndex: dashboardController.currentIndex.value,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.groups),
                label: 'Gruppo',
              ),
              NavigationDestination(
                icon: Badge(
                  label: Text('2'),
                  child: Icon(Icons.calendar_month),
                ),
                label: 'Calendario',
              ),
            ],
          ),
        ));
  }
}

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  void setIndex(int index) {
    currentIndex.value = index;
  }
}
