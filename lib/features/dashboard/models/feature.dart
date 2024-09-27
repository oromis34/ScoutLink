import 'package:flutter/material.dart';

class Feature {
  final String title;
  final IconData icon;
  final String? description;
  final String? path;
  final Function? action;

  Feature({
    required this.title,
    required this.icon,
    this.description,
    this.path,
    this.action,
  });
}
