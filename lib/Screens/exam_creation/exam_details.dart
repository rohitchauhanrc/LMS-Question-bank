import 'package:flutter/material.dart';
import '../questions_by_types/true_false.dart';
import '../upload_type/from_question_bank.dart';

class ExamDetailsScreen extends StatefulWidget {
  @override
  _ExamDetailsScreenState createState() => _ExamDetailsScreenState();
}

class _ExamDetailsScreenState extends State<ExamDetailsScreen> {
  bool shuffleQuestions = true;
  bool shuffleOptions = true;

  final TextEditingController _examNameController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Untitled exam'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {},
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: _examNameController,
                      decoration: const InputDecoration(
                        labelText: 'Exam Name *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: TextFormField(
                      controller: _durationController,
                      decoration: const InputDecoration(
                        labelText: 'Duration in min *',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: shuffleQuestions,
                    onChanged: (bool? value) {
                      setState(() {
                        shuffleQuestions = value!;
                      });
                    },
                  ),
                  const Text('Shuffle questions'),
                  const SizedBox(width: 16),
                  Checkbox(
                    value: shuffleOptions,
                    onChanged: (bool? value) {
                      setState(() {
                        shuffleOptions = value!;
                      });
                    },
                  ),
                  const Text('Shuffle options'),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Exam Instructions (optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_examNameController.text.isNotEmpty && _durationController.text.isNotEmpty) {
                    Navigator.pop(context, _examNameController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter both exam name and duration')),
                    );
                  }
                },
                child: const Text('Confirm'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _showQuestionPicker(context); // Show the question picker
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add questions'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'You can add your own questions\nor add from our question bank',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showQuestionPicker(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Add your own question'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TrueFalseScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text('Bulk Upload your questions'),
                onTap: () {
                  Navigator.of(context).pop();

                },
              ),
              ListTile(
                leading: const Icon(Icons.upload_file),
                title: const Text('Add Questions from bank'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FromQuestionBank()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
