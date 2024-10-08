import 'package:flutter/material.dart';

class RelaxationPage extends StatelessWidget {
  const RelaxationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relaxation'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is Relaxation?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Relaxation is a state of being free from tension and anxiety, achieved through various techniques that help the body and mind to calm down and rejuvenate.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Benefits of Relaxation:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Reduces muscle tension\n'
                '- Lowers heart rate and blood pressure\n'
                '- Enhances mood and emotional well-being\n'
                '- Improves focus and concentration\n'
                '- Promotes better sleep\n',
              ),
              const SizedBox(height: 16),
              const Text(
                'How to Get Started:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Find a quiet and comfortable space.\n'
                '2. Practice deep breathing exercises.\n'
                '3. Try progressive muscle relaxation techniques.\n'
                '4. Engage in gentle yoga or stretching.\n'
                '5. Listen to calming music or nature sounds.\n',
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add a function for relaxation audio or video guidance
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text('Start Relaxation Exercises'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
