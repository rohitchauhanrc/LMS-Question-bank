import 'package:flutter/material.dart';
import 'package:quiz_model/Screens/skill.dart';
import 'package:quiz_model/constants/fonts.dart';
import '../constants/chips.dart';


class ParticularCategoryScreen extends StatefulWidget {
  const ParticularCategoryScreen({super.key});

  @override
  State<ParticularCategoryScreen> createState() => _ParticularCategoryScreenState();
}

class _ParticularCategoryScreenState extends State<ParticularCategoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _categories = [
    'HTML',
    'CSS',
    'Angular',
    'Vue.JS',
    'SaaS',
    'LESS'
  ];

  void _addCategory(String newCategory) {
    setState(() {
      _categories.add(newCategory.toUpperCase());
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

  void _handleChipTap(String category) {
    if (category == 'HTML') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SkillPage()),
      );
    } else {
      // Handle other categories if needed
    }
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
              Text('Frontend', style: AppTextStyles.heading()),
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
                style: AppTextStyles.body(),
              ),
              const SizedBox(height: 20),
              Text('Categories', style: AppTextStyles.heading()),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3,
                  ),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return CategoryChip(
                      category: _categories[index],
                      style: AppTextStyles.body(),
                      onTap: () {
                        _handleChipTap(_categories[index]);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showAddCategoryDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                  ),
                  child: const Text(
                    'Add Yours',
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
