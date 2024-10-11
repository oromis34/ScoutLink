import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/features/auth/services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Check if the user is authenticated
    final authService = Get.find<AuthService>();

    if (authService.user == null) {
      // If the user is not authenticated, redirect to the login page
      return RouteSettings(name: '/access');
    }

    // If the user is authenticated, allow the navigation
    return null;
  }
}
