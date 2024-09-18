import 'package:get/get.dart';
import 'package:scout_link/features/auth/models/user.dart';

class AuthService extends GetxService {
  // Observable variables
  var isAuthenticated = false.obs;
  var user = Rxn<User>();

  // Simulated login function
  Future<void> login(String username, String password) async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    // For demonstration, assume login is always successful
    isAuthenticated.value = true;
    user.value = User(username: username);
    Get.offAllNamed("/");
  }

  // Simulated logout function
  Future<void> logout() async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    isAuthenticated.value = false;
    user.value = null;
    Get.offAllNamed("/access");
  }

  // Check if user is authenticated
  bool get isLoggedIn => isAuthenticated.value;
}
