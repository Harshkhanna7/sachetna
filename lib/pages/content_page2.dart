import 'package:flutter/material.dart';

class ContentPage2 extends StatelessWidget {
  final String title;

  const ContentPage2({
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
              "Mastering Your Emotions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            // Engaging description
            const Text(
              "Life presents us with challenges that can be overwhelming at times. Learning to navigate these emotions is crucial for maintaining balance and well-being. This section will guide you through essential coping strategies designed to empower you to handle stress and emotional turmoil effectively.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            // Coping Skills Tips with Dropdowns
            const Text(
              "Effective Coping Strategies:",
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
                  CopingSkill(
                    title: "1. Deep Breathing",
                    content:
                        "Deep breathing can help calm your mind and body. Try inhaling deeply through your nose, holding it for a few seconds, and then exhaling slowly through your mouth.",
                  ),
                  CopingSkill(
                    title: "2. Mindfulness Meditation",
                    content:
                        "Mindfulness meditation encourages you to focus on the present moment, helping reduce anxiety and stress. Set aside a few minutes each day to practice.",
                  ),
                  CopingSkill(
                    title: "3. Physical Activity",
                    content:
                        "Engaging in physical activity releases endorphins, which can help improve your mood. Aim for at least 30 minutes of exercise most days of the week.",
                  ),
                  CopingSkill(
                    title: "4. Journaling",
                    content:
                        "Writing down your thoughts and feelings can help you process your emotions. Consider keeping a daily journal to reflect on your experiences.",
                  ),
                  CopingSkill(
                    title: "5. Social Support",
                    content:
                        "Talking to friends or family members about your feelings can provide comfort and support. Don't hesitate to reach out to those you trust.",
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

class CopingSkill extends StatelessWidget {
  final String title;
  final String content;

  const CopingSkill({Key? key, required this.title, required this.content})
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
