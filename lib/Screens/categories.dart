import 'package:quiz_model/constants/fonts.dart';
import 'package:flutter/material.dart';

import '../constants/chips.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Welcome Back,',
                style: AppTextStyles.heading
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Category',
                  suffixIcon: const Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintStyle: AppTextStyles.body
                ),
              ),
              const SizedBox(height: 20),
              Text('Categories', style: AppTextStyles.heading),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  CategoryChip(
                    category: 'Tech',
                    style: AppTextStyles.body,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  CategoryChip(
                    category: 'Non - Tech',
                    style: AppTextStyles.body,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  CategoryChip(
                    category: 'OS',
                    style: AppTextStyles.body,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  CategoryChip(
                    category: 'Core Science',
                    style: AppTextStyles.body,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  CategoryChip(
                    category: 'Finance',
                    style: AppTextStyles.body,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  CategoryChip(
                    category: 'Programming Language',
                    style: AppTextStyles.body,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  CategoryChip(
                    category: 'More',
                    style: AppTextStyles.body,
                    isMoreButton: true,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
