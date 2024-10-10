import 'package:flutter/material.dart';

class Feature {
  final String title;
  final IconData icon;
  final Color color;
  final String? description;
  final String? path;
  final Function? action;
  final double flex;

  Feature({
    required this.title,
    required this.icon,
    this.color = Colors.blue,
    this.description,
    this.path,
    this.action,
    this.flex = 1.0,
  });
}
