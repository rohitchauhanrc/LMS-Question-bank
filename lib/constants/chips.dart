import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String category;
  final TextStyle style;
  final bool isMoreButton;
  final VoidCallback onTap;
  final Icon? suffixIcon;

  const CategoryChip({
    required this.category,
    required this.style,
    required this.onTap,
    this.isMoreButton = false,
    this.suffixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isMoreButton ? Colors.deepPurpleAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(category, style: style),
            if (suffixIcon != null) ...[
              const SizedBox(width: 8),
              suffixIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
