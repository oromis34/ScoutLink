import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/widgets/scrollable_header_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableHeaderPage(
      title: "profile_label".tr,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('CIAO PROFILO'),
      ),
    );
  }
}
