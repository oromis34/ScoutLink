import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialtiesScreen extends StatelessWidget {
  const SpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('specialties_label'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: const [
            Text('CIAO SPECIALITà'),
          ],
        ),
      ),
    );
  }
}
