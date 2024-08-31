import 'package:flutter/material.dart';
import 'fill_in_the_blanks.dart';
import 'match_the_following.dart';
import 'mcq.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'multi_correct_mcq.dart';

class TrueFalseScreen extends StatefulWidget {
  const TrueFalseScreen({super.key});

  @override
  _TrueFalseScreenState createState() => _TrueFalseScreenState();
}

class _TrueFalseScreenState extends State<TrueFalseScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _explanationController = TextEditingController();
  final TextEditingController _correctMarksController =
      TextEditingController(text: '1');
  final TextEditingController _wrongMarksController =
      TextEditingController(text: '0');

  String _selectedOption = '';
  bool _isCorrectSelected = false;
  String _selectedType = 'True or False';
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Question')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _questionController,
                decoration: InputDecoration(
                  labelText: "Type your question",
                  border: const OutlineInputBorder(),
                  errorText: _isCorrectSelected ? null : "Can't be empty",
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Type",
                  border: OutlineInputBorder(),
                ),
                value: _selectedType,
                items: [
                  'True or False',
                  'MCQ',
                  'Match the following',
                  'Fill in the blanks',
                  'Multiple answer Question'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedType = newValue!;
                    if (_selectedType == 'MCQ') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const McqScreen()),
                      );
                    } else if (_selectedType == 'Match the following') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MatchTheFollowingScreen()),
                      );
                    } else if (_selectedType == 'Fill in the blanks') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FillInTheBlanksScreen()),
                      );
                    } else if (_selectedType == 'Multiple answer Question') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MultiCorrectMcqScreen()),
                      );
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              RadioListTile<String>(
                title: const Text('True'),
                value: 'True',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                    _isCorrectSelected = true;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('False'),
                value: 'False',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                    _isCorrectSelected = true;
                  });
                },
              ),
              if (!_isCorrectSelected)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Please select the correct answer',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 20),
              TextField(
                controller: _explanationController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Explanation",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.image),
                    onPressed: _pickImage,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (_image != null)
                Image.file(
                  _image!,
                  height: 150,
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
                  if (_questionController.text.isEmpty || !_isCorrectSelected) {
                    setState(() {
                      _isCorrectSelected = false;
                    });
                  } else {
                    // Logic to handle form submission
                    print("Question: ${_questionController.text}");
                    print("Answer: $_selectedOption");
                    print("Explanation: ${_explanationController.text}");
                    print("Correct Marks: ${_correctMarksController.text}");
                    print("Wrong Marks: ${_wrongMarksController.text}");
                    if (_image != null) {
                      print("Image Path: ${_image!.path}");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5, // Shadow effect
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Confirm'),
              ),

              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child:
                    const Text('Remove', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
