import 'package:get/get.dart';
import 'package:scout_link/features/dashboard/screens/dashboard.dart';
import 'package:scout_link/features/auth/screens/access_screen.dart';
import 'package:scout_link/features/auth/screens/login_screen.dart';
import 'package:scout_link/features/auth/screens/register_screen.dart';
import 'package:scout_link/features/profile/screens/profile_screen.dart';
import 'package:scout_link/routes/middlewares/auth_middleware.dart';

// GoRouter configuration
final routes = [
  GetPage(
      name: '/',
      page: () => DashboardScreen(),
      middlewares: [AuthMiddleware()]),
  GetPage(
      name: '/profile',
      page: () => ProfileScreen(),
      middlewares: [AuthMiddleware()]),
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
