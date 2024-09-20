import 'package:flutter/material.dart';
import 'package:quiz_model/constants/fonts.dart';

class Question {
  final String questionText;
  final List<String> correctAnswers;

  Question({
    required this.questionText,
    required this.correctAnswers,
  });
}

class QuestionBankFillInTheBlanks extends StatefulWidget {
  final List<Question> questions = [
    Question(
      questionText:
          'The capital of France is ____, and the capital of Germany is ____.',
      correctAnswers: ['Paris', 'Berlin'],
    ),
    Question(
      questionText:
          'The largest planet is ____, and the hottest planet is ____.',
      correctAnswers: ['Jupiter', 'Venus'],
    ),
  ];

  QuestionBankFillInTheBlanks({super.key});

  @override
  State<QuestionBankFillInTheBlanks> createState() =>
      _QuestionBankFillInTheBlanksState();
}

class _QuestionBankFillInTheBlanksState
    extends State<QuestionBankFillInTheBlanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Fill in the Blanks'),
      ),
      body: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          final question = widget.questions[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.questionText,
                      style: AppTextStyles.heading(color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        question.correctAnswers.length,
                        (i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                                'Answer ${i + 1}: ${question.correctAnswers[i]}',
                                style: AppTextStyles.body(color: Colors.green)),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
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
            ),
          );
        },
      ),
    );
  }
}
