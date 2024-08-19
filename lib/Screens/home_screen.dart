import 'package:flutter/material.dart';

import '../main.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> categories = ["Tech", "Non - Tech", "OS", "Core Science", "Finance", "Programming Language"];

    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        title: Text("Welcome Back,"),
        backgroundColor: Colors.deepPurple[900],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Logic to add a new category or question
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Icon(Icons.add, color: Colors.white, size: 50),
                    SizedBox(height: 10),
                    Text("Click to Add Question", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Categories", style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: categories
                  .map((category) => CategoryChip(category: category))
                  .toList()
                ..add(
                  CategoryChip(
                    category: "More >",
                    isMoreButton: true,
                    onTap: () {
                      // Logic to handle 'More' button click
                    },
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}