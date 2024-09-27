import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/features/auth/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // Subtract one (1) here because of the thickness of the wiper above
      alignment: AlignmentDirectional.center,
      color: Colors.blueAccent,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed('/profile');
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, bottom: 12),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNtaWx5JTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    authService.user.value!.username,
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  Text(
                    '@sophia.com',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.top,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("CIASAONE"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
