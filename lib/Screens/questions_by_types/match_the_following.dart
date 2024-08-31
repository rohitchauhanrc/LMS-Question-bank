import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MatchTheFollowingScreen extends StatefulWidget {
  const MatchTheFollowingScreen({super.key});

  @override
  _MatchTheFollowingScreenState createState() =>
      _MatchTheFollowingScreenState();
}

class _MatchTheFollowingScreenState extends State<MatchTheFollowingScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _correctMarksController =
      TextEditingController(text: '1');
  final TextEditingController _wrongMarksController =
      TextEditingController(text: '0');
  bool _isQuestionValid = true;

  List<Map<String, dynamic>> pairs = [
    {
      'left': TextEditingController(),
      'right': TextEditingController(),
      'leftImage': null,
      'rightImage': null
    },
    {
      'left': TextEditingController(),
      'right': TextEditingController(),
      'leftImage': null,
      'rightImage': null
    },
  ];

  Future<void> _pickImage(int index, String side) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (side == 'left') {
          pairs[index]['leftImage'] = File(pickedFile.path);
        } else {
          pairs[index]['rightImage'] = File(pickedFile.path);
        }
      }
    });
  }

  void _addPair() {
    setState(() {
      pairs.add({
        'left': TextEditingController(),
        'right': TextEditingController(),
        'leftImage': null,
        'rightImage': null
      });
    });
  }

  // Method to remove a pair
  void _removePair(int index) {
    setState(() {
      if (pairs.length > 2) {
        pairs.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Match the Following',
      )),
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
                  errorText: _isQuestionValid ? null : "Can't be empty",
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: pairs.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextField(
                                  controller: pairs[index]['left'],
                                  decoration: InputDecoration(
                                    labelText: "Left Item ${index + 1}",
                                    border: const OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.image),
                                      onPressed: () =>
                                          _pickImage(index, 'left'),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                if (pairs[index]['leftImage'] != null)
                                  Image.file(
                                    pairs[index]['leftImage'],
                                    height: 100,
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              children: [
                                TextField(
                                  controller: pairs[index]['right'],
                                  decoration: InputDecoration(
                                    labelText: "Right Item ${index + 1}",
                                    border: const OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.image),
                                      onPressed: () =>
                                          _pickImage(index, 'right'),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                if (pairs[index]['rightImage'] != null)
                                  Image.file(
                                    pairs[index]['rightImage'],
                                    height: 100,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (pairs.length > 2)
                        TextButton(
                          onPressed: () => _removePair(index),
                          child: const Text('Remove Pair',
                              style: TextStyle(color: Colors.red)),
                        ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: _addPair,
                child: const Text('Add Pair'),
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
                    for (int i = 0; i < pairs.length; i++) {
                      print("Left Item ${i + 1}: ${pairs[i]['left'].text}");
                      print("Right Item ${i + 1}: ${pairs[i]['right'].text}");
                      if (pairs[i]['leftImage'] != null) {
                        print("Left Item ${i + 1} Image Path: ${pairs[i]['leftImage'].path}");
                      }
                      if (pairs[i]['rightImage'] != null) {
                        print("Right Item ${i + 1} Image Path: ${pairs[i]['rightImage'].path}");
                      }
                    }
                    print("Correct Marks: ${_correctMarksController.text}");
                    print("Wrong Marks: ${_wrongMarksController.text}");
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
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

              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Logic to remove the "Match the Following" form
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
