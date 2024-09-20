import 'package:flutter/material.dart';
import 'package:quiz_model/constants/fonts.dart';

class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}

class QuestionBankMCQ extends StatefulWidget {
  final List<Question> questions = [
    Question(
      questionText: 'What is the capital of France?',
      options: ['Berlin', 'Madrid', 'Paris', 'Rome'],
      correctOptionIndex: 2,
    ),
    Question(
      questionText: 'Which planet is known as the Red Planet?',
      options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
      correctOptionIndex: 1,
    ),
  ];

  QuestionBankMCQ({super.key});

  @override
  State<QuestionBankMCQ> createState() => _QuestionBankMCQState();
}

class _QuestionBankMCQState extends State<QuestionBankMCQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Add MCQs"),
      ),
      body: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          final question = widget.questions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: Card(
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
                    children: List.generate(
                      question.options.length,
                      (i) {
                        return ListTile(
                          title: Text(question.options[i],
                              style: AppTextStyles.body(
                                  color: i == question.correctOptionIndex
                                      ? Colors.green
                                      : Colors.black)),
                        );
                      },
                    ),
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
