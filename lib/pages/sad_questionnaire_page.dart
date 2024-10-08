import 'package:flutter/material.dart';
import 'sad_results_page.dart';

class SadQuestionnairePage extends StatefulWidget {
  const SadQuestionnairePage({super.key});

  @override
  _SadQuestionnairePageState createState() => _SadQuestionnairePageState();
}

class _SadQuestionnairePageState extends State<SadQuestionnairePage> {
  final List<int> _answers = List<int>.filled(9, 0); // Default answers to 0

  final List<String> _questions = [
    "1. Little interest or pleasure in doing things",
    "2. Feeling down, depressed, or hopeless",
    "3. Trouble falling or staying asleep, or sleeping too much",
    "4. Feeling tired or having little energy",
    "5. Poor appetite or overeating",
    "6. Feeling bad about yourself — or that you are a failure",
    "7. Trouble concentrating on things, such as reading",
    "8. Moving or speaking slowly or being fidgety/restless",
    "9. Thoughts of hurting yourself or being better off dead",
  ];

  void _submitAnswers() {
    int totalScore = _answers.reduce((a, b) => a + b);
    String depressionType;

    if (totalScore >= 20) {
      depressionType = 'Severe Depression';
    } else if (totalScore >= 15) {
      depressionType = 'Moderately Severe Depression';
    } else if (totalScore >= 10) {
      depressionType = 'Moderate Depression';
    } else if (totalScore >= 5) {
      depressionType = 'Mild Depression';
    } else {
      depressionType = 'No Depression';
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SadResultsPage(
          totalScore: totalScore,
          depressionType: depressionType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sadness Questionnaire"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please answer the following questions honestly:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _questions[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(4, (optionIndex) {
                              return Expanded(
                                child: RadioListTile<int>(
                                  title: Text(optionIndex.toString()),
                                  value: optionIndex,
                                  groupValue: _answers[index],
                                  onChanged: (value) {
                                    setState(() {
                                      _answers[index] = value!;
                                    });
                                  },
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitAnswers,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
