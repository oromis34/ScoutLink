import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Not Found'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/404.png', // Make sure to add your image in the assets folder and update pubspec.yaml
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              'Oops! Page not found.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offNamed("/"); // Update with your home route
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
