import 'package:flutter/material.dart';

class TimelineModel {
  const TimelineModel({
    required this.date,
    required this.label,
    required this.title,
    required this.body,
    required this.icon,
  });

  final String date;
  final String label;
  final String title;
  final String body;
  final IconData icon;
}
