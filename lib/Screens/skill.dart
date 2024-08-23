import 'package:flutter/material.dart';
import 'package:quiz_model/constants/fonts.dart';


class SkillPage extends StatelessWidget {
  const SkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // number of tabs (Easy, Medium, Hard)
      child: Scaffold(
        backgroundColor: Colors.deepPurple[900],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[900],
          elevation: 0,
          title: Text('HTML', style: AppTextStyles.heading(),),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Easy'),
              Tab(text: 'Medium'),
              Tab(text: 'Hard'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Easy Tab
            QuestionsPage(
              questions: [
                'Which attribute is used to specify the link destination in an anchor tag (<a>)?',
                'How do you create a line break in HTML?',
                'What is the purpose of the <p> tag in HTML?',
                'What is the correct syntax for creating a basic HTML document?',
              ],
            ),
            // Medium Tab
            QuestionsPage(
              questions: [
                // Add medium difficulty questions here
              ],
            ),
            // Hard Tab
            QuestionsPage(
              questions: [
                // Add hard difficulty questions here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionsPage extends StatelessWidget {
  final List<String> questions;

  const QuestionsPage({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Text(
              questions[index],
              style:  AppTextStyles.body()
            ),
          );
        },
      ),
    );
  }
}
