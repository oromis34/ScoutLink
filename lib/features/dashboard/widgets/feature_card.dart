import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/features/dashboard/models/feature.dart';

class FeatureCard extends StatelessWidget {
  final Feature feature;

  const FeatureCard({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    Color color = feature.color;
    IconData icon = feature.icon;
    String title = feature.title;

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: InkWell(
        onTap: () {
          if (feature.action != null) {
            feature.action!();
          } else if (feature.path != null) {
            Get.toNamed(feature.path!);
          }
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 48.0, color: color),
              SizedBox(height: 16),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
