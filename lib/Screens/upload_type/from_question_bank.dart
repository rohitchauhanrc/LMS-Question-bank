import 'package:flutter/material.dart';
import 'package:quiz_model/constants/fonts.dart';


class FromQuestionBank extends StatefulWidget {
  @override
  _FromQuestionBankState createState() => _FromQuestionBankState();
}

class _FromQuestionBankState extends State<FromQuestionBank> {
  String? selectedCourse;
  String? selectedSubject;
  String? selectedTopic;
  String? selectedSubtopic;
  String questionType = 'MCQ';
  String difficulty = 'Any';

  List<String> courses = ['Course 1', 'Course 2', 'Course 3'];
  List<String> subjects = ['Subject 1', 'Subject 2', 'Subject 3'];
  List<String> topics = ['Topic 1', 'Topic 2', 'Topic 3'];
  List<String> subtopics = ['Subtopic 1', 'Subtopic 2', 'Subtopic 3'];
  List<String> questionTypes = ['MCQ', 'True/False', 'Fill in the Blanks'];
  List<String> difficulties = ['Any', 'Easy', 'Medium', 'Hard'];

  // Reset all filters to default
  void clearFilters() {
    setState(() {
      selectedCourse = null;
      selectedSubject = null;
      selectedTopic = null;
      selectedSubtopic = null;
      questionType = 'MCQ';
      difficulty = 'Any';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Bank'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // The card-like container for filters
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Select Course Dropdown
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Course',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    value: selectedCourse,
                    items: courses.map((String course) {
                      return DropdownMenuItem<String>(
                        value: course,
                        child: Text(course),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCourse = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // Select Subject Dropdown
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Subject',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    value: selectedSubject,
                    items: subjects.map((String subject) {
                      return DropdownMenuItem<String>(
                        value: subject,
                        child: Text(subject),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // Select Topics Dropdown
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Topics',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    value: selectedTopic,
                    items: topics.map((String topic) {
                      return DropdownMenuItem<String>(
                        value: topic,
                        child: Text(topic),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedTopic = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // Select Subtopics Dropdown
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Subtopics',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    value: selectedSubtopic,
                    items: subtopics.map((String subtopic) {
                      return DropdownMenuItem<String>(
                        value: subtopic,
                        child: Text(subtopic),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSubtopic = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // Row for Question Type and Difficulty
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Question Type',
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          value: questionType,
                          items: questionTypes.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              questionType = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Difficulty Dropdown
                      DropdownButton<String>(
                        value: difficulty,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                        items: difficulties.map((String difficulty) {
                          return DropdownMenuItem<String>(
                            value: difficulty,
                            child: Text(difficulty),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            difficulty = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Search and Clear Filters buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add search logic here
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ), backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          child: Text('SEARCH', style: AppTextStyles.body()),
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: clearFilters,
                        child: Text(
                          'CLEAR FILTERS',
                            style: AppTextStyles.body(color: Colors.deepPurpleAccent)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar with Done and See Filters
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {
                // Add 'SEE FILTERS' logic here
              },
              icon: const Icon(Icons.arrow_upward, color: Colors.deepPurpleAccent),
              label: const Text(
                'SEE FILTERS',
                style: TextStyle(color: Colors.deepPurpleAccent),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add 'DONE' logic here
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('DONE'),
            ),
          ],
        ),
      ),
    );
  }
}
