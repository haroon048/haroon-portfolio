import 'package:flutter/material.dart';

class ProjectModel {
  const ProjectModel({
    required this.initial,
    required this.initialColor,
    required this.category,
    required this.title,
    required this.description,
    required this.tags,
    required this.imageAsset,
    required this.imageFit,
    this.galleryAssets = const <String>[],
  });

  final String initial;
  final Color initialColor;
  final String category;
  final String title;
  final String description;
  final List<String> tags;
  final String imageAsset;
  final BoxFit imageFit;
  final List<String> galleryAssets;
}
