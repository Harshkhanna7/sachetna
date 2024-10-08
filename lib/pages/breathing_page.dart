import 'package:flutter/material.dart';

class BreathingPage extends StatelessWidget {
  const BreathingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breathing'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is Breathing Exercises?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Breathing exercises are techniques that help control the breath to promote relaxation and improve mental focus. They can be used to reduce stress and anxiety, and enhance overall well-being.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Benefits of Breathing Exercises:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Reduces stress and anxiety\n'
                '- Increases lung capacity\n'
                '- Improves concentration\n'
                '- Enhances emotional regulation\n'
                '- Promotes relaxation and calmness\n',
              ),
              const SizedBox(height: 16),
              const Text(
                'How to Get Started:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Find a comfortable position (sitting or lying down).\n'
                '2. Close your eyes and take a deep breath in through your nose.\n'
                '3. Hold your breath for a few seconds.\n'
                '4. Exhale slowly through your mouth.\n'
                '5. Repeat for several minutes, focusing on your breath.\n',
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add a function for breathing exercises audio or guidance
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text('Start Breathing Exercises'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
