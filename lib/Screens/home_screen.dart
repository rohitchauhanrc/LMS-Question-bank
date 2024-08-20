import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_model/Screens/categories.dart';
import '../constants/chips.dart';
import '../constants/fonts.dart';

class HomeScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  HomeScreen({super.key});

  Future<void> _showPicker(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final XFile? pickedFile =
                  await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    // Do something with the image file
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Open Camera'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final XFile? pickedFile =
                  await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    // Do something with the image file
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "Tech",
      "Non - Tech",
      "OS",
      "Core Science",
      "Finance",
      "Programming Language"
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[900],
        appBar: AppBar(
          title: Text(
            "Welcome Back,",
            style: AppTextStyles.heading,
          ),
          backgroundColor: Colors.deepPurple[900],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.note_alt_outlined,
                          color: Colors.white, size: 70),
                      const SizedBox(height: 10),
                      Text("Click to Add Question", style: AppTextStyles.body),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text("Categories", style: AppTextStyles.heading),
              const SizedBox(height: 30),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categories
                    .map((category) => CategoryChip(
                  category: category,
                  style: AppTextStyles.body,
                  onTap: () {},
                ))
                    .toList()
                  ..add(
                    CategoryChip(
                      category: "More >",
                      isMoreButton: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Category()),
                        );
                      },
                      style: AppTextStyles.body,
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
