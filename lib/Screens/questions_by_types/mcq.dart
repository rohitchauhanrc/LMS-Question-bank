import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class McqScreen extends StatefulWidget {
  const McqScreen({super.key});

  @override
  _McqScreenState createState() => _McqScreenState();
}

class _McqScreenState extends State<McqScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _correctMarksController =
      TextEditingController(text: '1');
  final TextEditingController _wrongMarksController =
      TextEditingController(text: '0');
  String _selectedCorrectOption = '';
  bool _isCorrectSelected = false;

  // Option list to store option text and associated image (if any)
  List<Map<String, dynamic>> options = [
    {'text': TextEditingController(), 'image': null},
    {'text': TextEditingController(), 'image': null},
  ];

  // Method to pick an image
  Future<void> _pickImage(int index) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        options[index]['image'] = File(pickedFile.path);
      }
    });
  }

  // Method to add a new option
  void _addOption() {
    setState(() {
      options.add({'text': TextEditingController(), 'image': null});
    });
  }

  // Method to remove an option
  void _removeOption(int index) {
    setState(() {
      if (options.length > 2) {
        options.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MCQ Question')),
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: options[index]['text'],
                        decoration: InputDecoration(
                          labelText:
                              "Option ${String.fromCharCode(65 + index)}",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.image),
                            onPressed: () => _pickImage(index),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (options[index]['image'] != null)
                        Image.file(
                          options[index]['image'],
                          height: 150,
                        ),
                      const SizedBox(height: 10),
                      if (options.length > 2)
                        TextButton(
                          onPressed: () => _removeOption(index),
                          child: const Text('Remove Option',
                              style: TextStyle(color: Colors.red)),
                        ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: _addOption,
                child: const Text('Add Option'),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Correct Option",
                  border: OutlineInputBorder(),
                ),
                value: _selectedCorrectOption.isEmpty
                    ? null
                    : _selectedCorrectOption,
                items: options.asMap().entries.map((entry) {
                  int idx = entry.key;
                  return DropdownMenuItem<String>(
                    value: 'Option ${String.fromCharCode(65 + idx)}',
                    child: Text('Option ${String.fromCharCode(65 + idx)}'),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCorrectOption = newValue!;
                    _isCorrectSelected = true;
                  });
                },
              ),
              if (!_isCorrectSelected)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Please select the correct option',
                    style: TextStyle(color: Colors.red),
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
                  if (_questionController.text.isEmpty || _selectedCorrectOption.isEmpty) {
                    setState(() {
                      _isCorrectSelected = false;
                    });
                  } else {
                    // Logic to handle form submission
                    print("Question: ${_questionController.text}");
                    for (int i = 0; i < options.length; i++) {
                      print("Option ${String.fromCharCode(65 + i)}: ${options[i]['text'].text}");
                      if (options[i]['image'] != null) {
                        print("Option ${String.fromCharCode(65 + i)} Image Path: ${options[i]['image'].path}");
                      }
                    }
                    print("Correct Option: $_selectedCorrectOption");
                    print("Correct Marks: ${_correctMarksController.text}");
                    print("Wrong Marks: ${_wrongMarksController.text}");
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  elevation: 5, // Shadow effect
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10), // Vertical padding
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Confirm'),
              ),

              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Logic to remove the MCQ form
                },
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
