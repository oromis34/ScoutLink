import 'package:get/get.dart';
import 'package:scout_link/features/calendar/screens/calendar_screen.dart';
import 'package:scout_link/features/dashboard/screens/dashboard.dart';
import 'package:scout_link/features/auth/screens/access_screen.dart';
import 'package:scout_link/features/auth/screens/login_screen.dart';
import 'package:scout_link/features/auth/screens/register_screen.dart';
import 'package:scout_link/features/group/screens/group_screen.dart';
import 'package:scout_link/features/map/screens/map_screen.dart';
import 'package:scout_link/features/profile/screens/profile_screen.dart';
import 'package:scout_link/features/specialties/screens/specialties_screen.dart';
import 'package:scout_link/routes/middlewares/auth_middleware.dart';

// GoRouter configuration
final routes = [
  GetPage(name: '/', page: () => DashboardScreen(), middlewares: [
    AuthMiddleware()
  ], children: [
    GetPage(
      name: '/profile',
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: '/group',
      page: () => GroupScreen(),
    ),
    GetPage(
      name: '/calendar',
      page: () => CalendarScreen(),
    ),
    GetPage(
      name: '/specialties',
      page: () => SpecialtiesScreen(),
    ),
    GetPage(
      name: '/map',
      page: () => MapScreen(),
    ),
  ]),
  GetPage(name: '/access', page: () => AccessScreen(), children: [
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/register',
      page: () => RegisterScreen(),
    ),
  ]),
];
