import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthService extends GetxService {
  final Account _account;

  User? _user;
  User? get user => _user;

  AuthService(Client client) : _account = Account(client);

  Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  Future<AuthService> init() async {
    logger.i("Init...");
    try {
      _user = await _account.get();
      logger.i("User: ${_user?.name}");
    } catch(e) {
      debugPrint(e.toString());
      logger.e("Error: $e");
    }

    return this;
  }

  // Simulated login function
  Future<void> login(String username, String password) async {
    try {
      await _account.createOAuth2Session(
        provider: OAuthProvider.discord,
        scopes: ['openid']
      );
      logger.i("Logged");
      logger.i("User: ${_user?.name}");

      Get.offAllNamed('/');
    } catch (e) {
      logger.i("Error: $e");
    }
  }

  // Simulated logout function
  Future<void> logout() async {
    await _account.deleteSession(sessionId: 'current');
    Get.offAllNamed('/access');
  }
}
