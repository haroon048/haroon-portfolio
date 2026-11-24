import 'package:flutter/material.dart';

class ServiceModel {
  const ServiceModel({
    required this.key,
    required this.navLabel,
    required this.doorLabel,
    required this.title,
    required this.description,
    required this.bullets,
    required this.tags,
    required this.doorGradient,
    required this.doorTextColor,
    required this.iconLetter,
  });

  final String key;
  final String navLabel;
  final String doorLabel;
  final String title;
  final String description;
  final List<String> bullets;
  final List<String> tags;
  final LinearGradient doorGradient;
  final Color doorTextColor;
  final String iconLetter;
}
