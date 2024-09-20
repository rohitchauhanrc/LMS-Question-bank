import 'package:flutter/material.dart';

import '../../constants/fonts.dart';

class MatchTheFollowingQuestion {
  final String questionText;
  final List<String> optionsA;
  final List<String> optionsB;
  final List<String> correctMatches;
  final List<List<String>> combinations;

  MatchTheFollowingQuestion({
    required this.questionText,
    required this.optionsA,
    required this.optionsB,
    required this.correctMatches,
    required this.combinations,
  });
}

class QuestionBankMatchTheFollowing extends StatefulWidget {
  final List<MatchTheFollowingQuestion> questions = [
    MatchTheFollowingQuestion(
      questionText: 'Match the planets with their corresponding features:',
      optionsA: ['1. Earth', '2. Mars', '3. Jupiter', '4. Venus'],
      optionsB: ['a. Red Planet', 'b. Gas Giant', 'c. Hot Planet', 'd. Blue Planet'],
      correctMatches: ['1 - d', '2 - a', '3 - b', '4 - c'],
      combinations: [
        ['1 - d', '2 - a', '3 - b', '4 - c'],
        ['1 - a', '2 - b', '3 - c', '4 - d'],
        ['1 - c', '2 - d', '3 - a', '4 - b'],
        ['1 - b', '2 - c', '3 - d', '4 - a'],
      ],
    ),
    MatchTheFollowingQuestion(
      questionText: 'Match the authors with their corresponding books:',
      optionsA: ['1. J.K. Rowling', '2. J.R.R. Tolkien', '3. George R.R. Martin', '4. Leo Tolstoy'],
      optionsB: ['a. Harry Potter', 'b. The Lord of the Rings', 'c. A Song of Ice and Fire', 'd. War and Peace'],
      correctMatches: ['1 - a', '2 - b', '3 - c', '4 - d'],
      combinations: [
        ['1 - a', '2 - b', '3 - c', '4 - d'],
        ['1 - b', '2 - a', '3 - d', '4 - c'],
        ['1 - d', '2 - c', '3 - a', '4 - b'],
        ['1 - c', '2 - d', '3 - b', '4 - a'],
      ],
    ),
  ];

  QuestionBankMatchTheFollowing({super.key});

  @override
  State<QuestionBankMatchTheFollowing> createState() => _QuestionBankMatchTheFollowingState();
}

class _QuestionBankMatchTheFollowingState extends State<QuestionBankMatchTheFollowing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Add Match the Following"),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: question.optionsA
                              .map((optionA) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(optionA, style: AppTextStyles.body(color: Colors.black)),
                          ))
                              .toList(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: question.optionsB
                              .map((optionB) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(optionB, style: AppTextStyles.body(color: Colors.black)),
                          ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(
                      question.combinations.length,
                          (i) {
                        final combination = question.combinations[i];
                        final isCorrect = combination.toString() == question.correctMatches.toString();

                        return ListTile(
                          title: Text(
                            'Option ${i + 1}: ${combination.join(', ')}',
                            style: AppTextStyles.body(
                                color: isCorrect ? Colors.green : Colors.black),
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
