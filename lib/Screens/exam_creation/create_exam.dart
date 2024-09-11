import 'package:flutter/material.dart';

import 'exam_details.dart';

class CreateExam extends StatefulWidget {
  @override
  _CreateExamState createState() => _CreateExamState();
}

class _CreateExamState extends State<CreateExam> {
  List<String> examList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exams'),
      ),
      body: examList.isEmpty
          ? const Center(
        child: Text('Exams you create will appear here'),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: examList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(examList[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _removeExam(index);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: Center(
        child: ElevatedButton.icon(
          onPressed: () async {
            final newExamTitle = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExamDetailsScreen(),
              ),
            );


            if (newExamTitle != null && newExamTitle.isNotEmpty) {
              setState(() {
                examList.add(newExamTitle);
              });
            }
          },
          icon: const Icon(Icons.add),
          label: const Text('Create a new exam'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  void _removeExam(int index) {
    setState(() {
      examList.removeAt(index);
    });
  }
}