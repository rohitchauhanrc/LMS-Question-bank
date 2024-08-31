import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FillInTheBlanksScreen extends StatefulWidget {
  const FillInTheBlanksScreen({super.key});

  @override
  _FillInTheBlanksScreenState createState() => _FillInTheBlanksScreenState();
}

class _FillInTheBlanksScreenState extends State<FillInTheBlanksScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _correctMarksController = TextEditingController(text: '1');
  final TextEditingController _wrongMarksController = TextEditingController(text: '0');
  final TextEditingController _explanationController = TextEditingController();
  bool _isQuestionValid = true;

  // List to store the correct answers for the blanks
  final List<TextEditingController> _blankControllers = [TextEditingController()];

  // Variable to store the selected question image
  File? _questionImage;

  // Method to pick an image for the question
  Future<void> _pickQuestionImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _questionImage = File(pickedFile.path);
      });
    }
  }

  // Method to add a new blank
  void _addBlank() {
    setState(() {
      _blankControllers.add(TextEditingController());
    });
  }

  // Method to remove a blank
  void _removeBlank(int index) {
    setState(() {
      if (_blankControllers.length > 1) {
        _blankControllers.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fill in the Blanks')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _questionController,
                      decoration: InputDecoration(
                        labelText: "Type your sentence with blanks",
                        border: const OutlineInputBorder(),
                        errorText: _isQuestionValid ? null : "Can't be empty",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.image),
                    onPressed: _pickQuestionImage,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (_questionImage != null)
                Image.file(
                  _questionImage!,
                  height: 100,
                ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _blankControllers.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _blankControllers[index],
                              decoration: InputDecoration(
                                labelText: "Blank ${index + 1}",
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (_blankControllers.length > 1)
                            IconButton(
                              icon: const Icon(Icons.remove_circle, color: Colors.red),
                              onPressed: () => _removeBlank(index),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: _addBlank,
                child: const Text('Add Blank'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _explanationController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Explanation',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _correctMarksController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Correct marks',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: _wrongMarksController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Wrong marks',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_questionController.text.isEmpty) {
                    setState(() {
                      _isQuestionValid = false;
                    });
                  } else {
                    setState(() {
                      _isQuestionValid = true;
                    });
                    // Logic to handle form submission
                    print("Question: ${_questionController.text}");
                    if (_questionImage != null) {
                      print("Question Image Path: ${_questionImage!.path}");
                    }
                    for (int i = 0; i < _blankControllers.length; i++) {
                      print("Blank ${i + 1}: ${_blankControllers[i].text}");
                    }
                    print("Explanation: ${_explanationController.text}");
                    print("Correct Marks: ${_correctMarksController.text}");
                    print("Wrong Marks: ${_wrongMarksController.text}");
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.teal, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  elevation: 8, // Shadow effect
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10), // Padding
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('Confirm'),
              ),

              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Logic to remove the "Fill in the Blanks" form
                },
                child: const Text('Remove', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
