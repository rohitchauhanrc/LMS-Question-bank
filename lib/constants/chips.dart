import 'package:flutter/material.dart';

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

  @override
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