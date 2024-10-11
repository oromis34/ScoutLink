import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:scout_link/features/auth/services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  RouteSettings? redirect(String? route) {
    // Check if the user is authenticated
    final authService = Get.find<AuthService>();
    logger.i("Middleware User: ${authService.user?.name}");

    if (authService.user == null) {
      // If the user is not authenticated, redirect to the login page
      logger.w("User not authenticated");
      return RouteSettings(name: '/access');
    }

    logger.w("User authenticated");
    // If the user is authenticated, allow the navigation
    return null;
  }
}
