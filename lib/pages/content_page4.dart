import 'package:flutter/material.dart';

class ContentPage4 extends StatelessWidget {
  final String title;

  const ContentPage4({
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
              "Navigating Relationship Issues",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            // Engaging description
            const Text(
              "Relationships can be challenging, and conflicts may arise. This section will explore common relationship issues and provide strategies to address them effectively.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            // Relationship Issues Tips with Dropdowns
            const Text(
              "Addressing Common Relationship Issues:",
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
                  RelationshipIssue(
                    title: "1. Communication Problems",
                    content:
                        "Open and honest communication is crucial. Share your feelings and concerns without blaming your partner.",
                  ),
                  RelationshipIssue(
                    title: "2. Trust Issues",
                    content:
                        "Build trust by being reliable and transparent. Address any past betrayals with honesty and seek to rebuild trust together.",
                  ),
                  RelationshipIssue(
                    title: "3. Conflict Resolution",
                    content:
                        "Learn to resolve conflicts constructively. Use 'I' statements to express how you feel, and focus on finding solutions together.",
                  ),
                  RelationshipIssue(
                    title: "4. Balancing Independence and Togetherness",
                    content:
                        "It's important to maintain individual interests while nurturing your relationship. Encourage each other’s personal growth.",
                  ),
                  RelationshipIssue(
                    title: "5. Seeking Professional Help",
                    content:
                        "If issues persist, consider couples therapy. A professional can provide valuable insights and tools to strengthen your relationship.",
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

class RelationshipIssue extends StatelessWidget {
  final String title;
  final String content;

  const RelationshipIssue(
      {Key? key, required this.title, required this.content})
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
