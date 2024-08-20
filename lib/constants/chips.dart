import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String category;
  final bool isMoreButton;
  final VoidCallback? onTap;
  final TextStyle style;

  const CategoryChip({
    super.key,
    required this.category,
    this.isMoreButton = false,
    this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.deepPurple[900] ?? Colors.deepPurple,
          borderRadius: BorderRadius.circular(0),
          border: Border.all(
            color: Colors.white, // Set border color to white
          ),
        ),
        child: Text(
          category,
          style: style.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}