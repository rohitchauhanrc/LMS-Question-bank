import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultiCorrectMcqScreen extends StatefulWidget {
  const MultiCorrectMcqScreen({super.key});

  @override
  _MultiCorrectMcqScreenState createState() => _MultiCorrectMcqScreenState();
}

class _MultiCorrectMcqScreenState extends State<MultiCorrectMcqScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _correctMarksController = TextEditingController(text: '1');
  final TextEditingController _wrongMarksController = TextEditingController(text: '0');
  final List<bool> _selectedCorrectOptions = [];
  List<Map<String, dynamic>> options = [
    {'text': TextEditingController(), 'image': null},
    {'text': TextEditingController(), 'image': null},
  ];

  Future<void> _pickImage(int index) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        options[index]['image'] = File(pickedFile.path);
      }
    });
  }

  void _addOption() {
    setState(() {
      options.add({'text': TextEditingController(), 'image': null});
      _selectedCorrectOptions.add(false);
    });
  }

  void _removeOption(int index) {
    setState(() {
      if (options.length > 2) {
        options.removeAt(index);
        _selectedCorrectOptions.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiple Answer Question')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _questionController,
                decoration: const InputDecoration(
                  labelText: "Type your question",
                  border: OutlineInputBorder(),
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
                      Row(
                        children: [
                          Checkbox(
                            value: index < _selectedCorrectOptions.length
                                ? _selectedCorrectOptions[index]
                                : false,
                            onChanged: (bool? value) {
                              setState(() {
                                if (index < _selectedCorrectOptions.length) {
                                  _selectedCorrectOptions[index] = value!;
                                }
                              });
                            },
                          ),
                          Expanded(
                            child: TextField(
                              controller: options[index]['text'],
                              decoration: InputDecoration(
                                labelText: "Option ${String.fromCharCode(65 + index)}",
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.image),
                                  onPressed: () => _pickImage(index),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                          child: const Text('Remove Option', style: TextStyle(color: Colors.red)),
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
                  if (_questionController.text.isEmpty || !_selectedCorrectOptions.contains(true)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill all fields and select at least one correct option'),
                        backgroundColor: Colors.red, // Background color of the SnackBar
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(16),
                      ),
                    );
                  } else {
                    // Logic to handle form submission
                    print("Question: ${_questionController.text}");
                    for (int i = 0; i < options.length; i++) {
                      print("Option ${String.fromCharCode(65 + i)}: ${options[i]['text'].text}");
                      if (options[i]['image'] != null) {
                        print("Option ${String.fromCharCode(65 + i)} Image Path: ${options[i]['image'].path}");
                      }
                    }
                    print("Correct Options Indices: ${_selectedCorrectOptions.asMap().entries.where((entry) => entry.value).map((entry) => entry.key).toList()}");
                    print("Correct Marks: ${_correctMarksController.text}");
                    print("Wrong Marks: ${_wrongMarksController.text}");
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  elevation: 6, // Shadow effect
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
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
