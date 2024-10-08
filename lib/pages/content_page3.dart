import 'package:flutter/material.dart';

class ContentPage3 extends StatelessWidget {
  final String title;

  const ContentPage3({
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
              "Enhancing Your Social Skills",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            // Engaging description
            const Text(
              "Social skills are essential for building relationships and navigating social situations. This section provides strategies to improve your communication, empathy, and interaction with others.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            // Social Skills Tips with Dropdowns
            const Text(
              "Key Social Skills Strategies:",
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
                  SocialSkill(
                    title: "1. Active Listening",
                    content:
                        "Pay close attention to what others are saying. Nod, maintain eye contact, and provide feedback to show you're engaged.",
                  ),
                  SocialSkill(
                    title: "2. Nonverbal Communication",
                    content:
                        "Be aware of your body language, facial expressions, and gestures. These can convey messages just as strongly as words.",
                  ),
                  SocialSkill(
                    title: "3. Empathy",
                    content:
                        "Try to understand and share the feelings of others. Put yourself in their shoes to better connect and respond.",
                  ),
                  SocialSkill(
                    title: "4. Initiating Conversations",
                    content:
                        "Practice starting conversations with simple greetings or questions. Show genuine interest in others' thoughts and experiences.",
                  ),
                  SocialSkill(
                    title: "5. Maintaining Healthy Boundaries",
                    content:
                        "Understand your own limits and respect others' boundaries. Clear communication is key to maintaining healthy relationships.",
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

class SocialSkill extends StatelessWidget {
  final String title;
  final String content;

  const SocialSkill({Key? key, required this.title, required this.content})
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
