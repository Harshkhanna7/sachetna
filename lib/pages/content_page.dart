import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  final String title;
  final String description;

  const ContentPage({
    Key? key,
    required this.title,
    required this.description,
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
              "Mastering Your Study Skills",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            // Engaging description
            const Text(
              "Unlock your academic potential by adopting effective study strategies. Explore practical tips that will enhance your learning experience and help you achieve your goals.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            // Study Tips with Dropdowns
            const Text(
              "Essential Study Tips:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  StudyTip(
                    title: "Create a Dedicated Study Space",
                    content:
                        "Designate a specific area in your home or library for studying. This space should be free from distractions and stocked with all necessary materials to help you focus and stay productive.",
                  ),
                  StudyTip(
                    title: "Utilize Active Learning Techniques",
                    content:
                        "Incorporate methods like summarizing, questioning, and teaching others into your study sessions. Engaging actively with the material improves retention and understanding.",
                  ),
                  StudyTip(
                    title: "Take Regular Breaks to Maintain Focus",
                    content:
                        "Short breaks during study sessions can help refresh your mind. Try techniques like the Pomodoro method: study for 25 minutes and then take a 5-minute break.",
                  ),
                  StudyTip(
                    title: "Stay Organized with a Planner",
                    content:
                        "Use a planner or digital calendar to track your assignments, deadlines, and study sessions. Staying organized can help you manage your time more effectively and reduce stress.",
                  ),
                  StudyTip(
                    title: "Form Study Groups for Collaborative Learning",
                    content:
                        "Studying with peers can provide different perspectives on the material. Group discussions help reinforce learning and can lead to a deeper understanding of the subject matter.",
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

class StudyTip extends StatelessWidget {
  final String title;
  final String content;

  const StudyTip({Key? key, required this.title, required this.content})
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
