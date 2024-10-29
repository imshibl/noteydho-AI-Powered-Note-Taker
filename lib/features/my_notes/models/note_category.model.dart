import 'package:flutter/material.dart';

class NoteCategoryModel {
  final String categoryName;
  final int notes;
  final Color color;

  NoteCategoryModel(
      {required this.categoryName, required this.notes, required this.color});
}
