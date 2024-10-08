import 'package:flutter/material.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is Meditation?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Meditation is a practice where an individual uses a technique – such as mindfulness, or focusing the mind on a particular object, thought, or activity – to train attention and awareness, and achieve a mentally clear and emotionally calm and stable state.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Benefits of Meditation:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Reduces stress\n'
                '- Controls anxiety\n'
                '- Promotes emotional health\n'
                '- Enhances self-awareness\n'
                '- Lengthens attention span\n',
              ),
              const SizedBox(height: 16),
              const Text(
                'How to Get Started:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Find a quiet place.\n'
                '2. Sit or lie down comfortably.\n'
                '3. Close your eyes and focus on your breath.\n'
                '4. If your mind wanders, gently bring your focus back to your breath.\n'
                '5. Start with just a few minutes a day and gradually increase.\n',
              ),
              const SizedBox(height: 16),
              const Text(
                'Examples of Meditation Techniques:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Mindfulness Meditation\n'
                '- Guided Visualization\n'
                '- Loving-Kindness Meditation\n'
                '- Body Scan Meditation\n',
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add a function for meditation audio or video guidance
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blueAccent, // Updated to use backgroundColor
                  ),
                  child: const Text('Start Guided Meditation'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
