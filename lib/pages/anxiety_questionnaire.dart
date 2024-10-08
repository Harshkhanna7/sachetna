import 'package:flutter/material.dart';
import 'anxiety_results_page.dart';

class AnxietyQuestionnairePage extends StatefulWidget {
  const AnxietyQuestionnairePage({super.key});

  @override
  _AnxietyQuestionnairePageState createState() =>
      _AnxietyQuestionnairePageState();
}

class _AnxietyQuestionnairePageState extends State<AnxietyQuestionnairePage> {
  final List<int> _answers = List<int>.filled(9, 0); // Default answers to 0

  final List<String> _questions = [
    "1. Feeling nervous, anxious, or on edge",
    "2. Not being able to stop or control worrying",
    "3. Worrying too much about different things",
    "4. Trouble relaxing",
    "5. Being so restless that it is hard to sit still",
    "6. Becoming easily annoyed or irritable",
    "7. Feeling afraid as if something awful might happen",
    "8. Difficulty concentrating",
    "9. Having physical symptoms such as headaches or stomachaches",
  ];

  void _submitAnswers() {
    int totalScore = _answers.reduce((a, b) => a + b);
    String anxietyType;

    if (totalScore >= 20) {
      anxietyType = 'Severe Anxiety';
    } else if (totalScore >= 15) {
      anxietyType = 'Moderately Severe Anxiety';
    } else if (totalScore >= 10) {
      anxietyType = 'Moderate Anxiety';
    } else if (totalScore >= 5) {
      anxietyType = 'Mild Anxiety';
    } else {
      anxietyType = 'No Anxiety';
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnxietyResultsPage(
          totalScore: totalScore,
          anxietyType: anxietyType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anxiety Questionnaire"),
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
