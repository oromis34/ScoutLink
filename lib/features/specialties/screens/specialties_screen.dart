import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/widgets/scrollable_header_page.dart';

class SpecialtiesScreen extends StatelessWidget {
  const SpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableHeaderPage(
      title: "specialties_label".tr,
      canGoBack: true,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: const [
            Text('CIAO SPECIALITA\''),
          ],
        ),
      ),
    );
  }
}
