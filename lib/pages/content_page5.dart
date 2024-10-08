import 'package:flutter/material.dart';

class ContentPage5 extends StatelessWidget {
  final String title;

  const ContentPage5({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor:
            const Color.fromARGB(255, 223, 200, 228), // Match the theme color
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 223, 200, 228), // Background color matching the theme
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Engaging title
            const Text(
              "Overcoming Sleep Issues",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            // Engaging description
            const Text(
              "Quality sleep is essential for overall health and well-being. This section will offer strategies to improve your sleep hygiene and overcome common sleep challenges.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            // Sleep Issues Tips with Dropdowns
            const Text(
              "Tips for Better Sleep:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  SleepIssue(
                    title: "1. Establish a Sleep Schedule",
                    content:
                        "Go to bed and wake up at the same time every day, even on weekends. This helps regulate your body's internal clock.",
                  ),
                  SleepIssue(
                    title: "2. Create a Relaxing Bedtime Routine",
                    content:
                        "Engage in calming activities before bed, such as reading, gentle stretching, or listening to soothing music.",
                  ),
                  SleepIssue(
                    title: "3. Optimize Your Sleep Environment",
                    content:
                        "Ensure your bedroom is cool, dark, and quiet. Consider using blackout curtains, earplugs, or a white noise machine.",
                  ),
                  SleepIssue(
                    title: "4. Limit Screen Time Before Bed",
                    content:
                        "Avoid screens (phones, computers, TVs) at least an hour before sleep. The blue light can disrupt your ability to fall asleep.",
                  ),
                  SleepIssue(
                    title: "5. Be Mindful of Food and Drink",
                    content:
                        "Avoid large meals, caffeine, and alcohol close to bedtime, as these can interfere with sleep quality.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SleepIssue extends StatelessWidget {
  final String title;
  final String content;

  const SleepIssue({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
