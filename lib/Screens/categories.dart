import 'package:flutter/material.dart';
import 'package:quiz_model/Screens/sub_categories.dart';
import 'package:quiz_model/constants/fonts.dart';
import '../constants/chips.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _categories = [
    'Tech',
    'Non - Tech',
    'OS',
    'Core Science',
    'Finance',
    'Programming Language'
  ];

  void _addCategory(String newCategory) {
    setState(() {
      _categories.add(newCategory);
    });
  }

  Future<void> _showAddCategoryDialog(BuildContext context) async {
    TextEditingController categoryController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Category'),
          content: TextField(
            controller: categoryController,
            decoration: const InputDecoration(hintText: "Enter category name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                String newCategory = categoryController.text.trim();
                if (newCategory.isNotEmpty) {
                  _addCategory(newCategory);
                }
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }

  void _navigateToSubCategoryPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubCategory()),
    );
  }

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
              Text('Welcome Back,', style: AppTextStyles.heading()),
              const SizedBox(height: 20),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Category',
                  suffixIcon: const Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintStyle: AppTextStyles.body(),
                ),
              ),
              const SizedBox(height: 20),
              Text('Categories', style: AppTextStyles.heading()),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _categories.map((category) {
                  return CategoryChip(
                    category: category,
                    style: AppTextStyles.body(),
                    onTap: () {
                      if (category == 'Tech') {
                        _navigateToSubCategoryPage(context);
                      } else {
                        // Handle tap for other categories if needed
                      }
                    },
                  );
                }).toList()
                  ..add(
                    CategoryChip(
                      category: 'Add Your',
                      style: AppTextStyles.body(),
                      isMoreButton: true,
                      onTap: () {
                        _showAddCategoryDialog(context);
                      },
                      suffixIcon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

