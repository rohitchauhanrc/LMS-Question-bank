import 'package:flutter/material.dart';
import 'package:quiz_model/Screens/particular_categories.dart';
import 'package:quiz_model/Screens/sub_categories.dart';
import 'package:quiz_model/constants/fonts.dart';
import '../constants/chips.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({super.key});

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _categories = [
    'Frontend',
    'Backend',
    'Devops',
    'Full Stacks',
    'Software Engineer',
    'Data Analyst'
  ];

  void _addSubCategory(String newSubCategory) {
    setState(() {
      _categories.add(newSubCategory);
    });
  }

  Future<void> _showAddSubCategoryDialog(BuildContext context) async {
    TextEditingController SubCategoryController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add SubCategory'),
          content: TextField(
            controller: SubCategoryController,
            decoration: const InputDecoration(hintText: "Enter your category"),
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
                String newSubCategory = SubCategoryController.text.trim();
                if (newSubCategory.isNotEmpty) {
                  _addSubCategory(newSubCategory);
                }
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }

  void _navigateToFrontendPage(BuildContext context) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tech', style: AppTextStyles.heading()),
                const SizedBox(height: 20),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Sub category',
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
                  children: _categories.map((SubCategory) {
                    return CategoryChip(
                      category: SubCategory,
                      style: AppTextStyles.body(),
                      onTap: () {
                        if (SubCategory == 'Tech') {
                          _navigateToFrontendPage(context);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ParticularCategoryScreen()),
                          );
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
                          _showAddSubCategoryDialog(context);
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
      ),
    );
  }
}

