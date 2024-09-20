import 'package:flutter/material.dart';
import 'package:quiz_model/constants/fonts.dart';

class Question {
  final String questionText;
  final List<String> options;
  final List<int> correctOptionIndices;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndices,
  });
}

class QuestionBankMultiCorrect extends StatefulWidget {
  final List<Question> questions = [
    Question(
      questionText: 'What is the capital of France?',
      options: ['Berlin', 'Madrid', 'Paris', 'Rome'],
      correctOptionIndices: [2],
    ),
    Question(
      questionText: 'Which of the following are gas planets?',
      options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
      correctOptionIndices: [1, 2],
    ),
  ];

  QuestionBankMultiCorrect({super.key});

  @override
  State<QuestionBankMultiCorrect> createState() =>
      _QuestionBankMultiCorrectState();
}

class _QuestionBankMultiCorrectState extends State<QuestionBankMultiCorrect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Multi Correct'),
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
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: List.generate(
                      question.options.length,
                      (i) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: ListTile(
                            title: Text(question.options[i],
                                style: AppTextStyles.body(
                                  color:
                                      question.correctOptionIndices.contains(i)
                                          ? Colors.green
                                          : Colors.black,
                                )),
                          ),
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
