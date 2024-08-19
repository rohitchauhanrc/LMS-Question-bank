import 'package:flutter/material.dart';


/// A widget that displays a category chip.
///
/// [category] is the name of the category displayed in the chip.
/// [isMoreButton] indicates if the chip should be styled as a "More >" button.

class CategoryChip{
  final String category;
  final bool isMoreButton;
  final VoidCallback onTap;
  final TextStyle style;
  final Color backgroundColor;

  CategoryChip({
    required this.category,
    this.isMoreButton = false,
    required this.onTap,
    required this.style,
    required this.backgroundColor,
  });

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          category,
          style: style,
        ),
        backgroundColor: backgroundColor,
        labelStyle: TextStyle(
          color: isMoreButton ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}