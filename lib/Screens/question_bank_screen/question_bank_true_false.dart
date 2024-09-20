import 'package:flutter/material.dart';
import 'package:quiz_model/constants/fonts.dart';

class Question {
  final String questionText;
  final bool correctAnswer;

  Question({
    required this.questionText,
    required this.correctAnswer,
  });
}

class QuestionBankTrueFalse extends StatefulWidget {
  final List<Question> questions = [
    Question(
      questionText: 'The earth is flat.',
      correctAnswer: false,
    ),
    Question(
      questionText: 'Water boils at 100°C.',
      correctAnswer: true,
    ),
  ];

  QuestionBankTrueFalse({super.key});

  @override
  State<QuestionBankTrueFalse> createState() =>
      _QuestionBankTrueFalseState();
}

class _QuestionBankTrueFalseState extends State<QuestionBankTrueFalse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add True/False'),
      ),
      body: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          final question = widget.questions[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      question.questionText,
                      style: AppTextStyles.heading(color: Colors.black),
                    ),
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: Text('True',
                            style: AppTextStyles.body(
                                color: question.correctAnswer == true
                                    ? Colors.green
                                    : Colors.black)),
                      ),
                      ListTile(
                        title: Text('False',
                            style: AppTextStyles.body(
                                color: question.correctAnswer == false
                                    ? Colors.green
                                    : Colors.black)),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.indigoAccent,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.add),
                            const SizedBox(width: 5),
                            Text(
                              'Add',
                              style: AppTextStyles.body(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
