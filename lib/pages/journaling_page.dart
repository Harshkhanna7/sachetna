import 'package:flutter/material.dart';

class JournalingPage extends StatelessWidget {
  const JournalingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journaling'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is Journaling?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Journaling is the practice of regularly writing down thoughts, feelings, and experiences to reflect on and process emotions, track personal growth, and enhance self-awareness.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Benefits of Journaling:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Reduces stress\n'
                '- Enhances emotional intelligence\n'
                '- Boosts memory and comprehension\n'
                '- Helps clarify thoughts and feelings\n'
                '- Encourages goal setting and accountability\n',
              ),
              const SizedBox(height: 16),
              const Text(
                'How to Get Started:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Choose a journaling method (digital or paper).\n'
                '2. Set aside time daily or weekly to write.\n'
                '3. Write freely without worrying about grammar or structure.\n'
                '4. Reflect on your entries periodically.\n'
                '5. Be honest and open in your writing.\n',
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add a function for journaling prompts or tips
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text('Start Journaling'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
