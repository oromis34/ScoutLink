import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final Account _account;

  User? _user;
  User? get user => _user;

  AuthService(Client client) : _account = Account(client);

  Future<void> init() async {
    try {
      _user = await _account.get();
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  // Simulated login function
  Future<void> login(String username, String password) async {
    try {
      await _account.createOAuth2Session(
        provider: OAuthProvider.google,
        scopes: ['openid']
      );
    } catch (e) {
      print("Error: $e");
    }
  }

  // Simulated logout function
  Future<void> logout() async {
    // TODO
  }
}
