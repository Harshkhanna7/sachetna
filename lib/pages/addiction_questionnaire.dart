import 'package:flutter/material.dart';
import 'addiction_results_page.dart';

class AddictionQuestionnairePage extends StatefulWidget {
  const AddictionQuestionnairePage({super.key});

  @override
  _AddictionQuestionnairePageState createState() =>
      _AddictionQuestionnairePageState();
}

class _AddictionQuestionnairePageState
    extends State<AddictionQuestionnairePage> {
  final List<int> _answers = List<int>.filled(9, 0); // Default answers to 0

  final List<String> _questions = [
    "1. Have you ever felt you should cut down on your drinking or drug use?",
    "2. Have people annoyed you by criticizing your drinking or drug use?",
    "3. Have you ever felt bad or guilty about your drinking or drug use?",
    "4. Have you ever had a drink or used drugs first thing in the morning to steady your nerves?",
    "5. Have you experienced withdrawal symptoms when the effects of alcohol or drugs wear off?",
    "6. Have you found that you often drink or use drugs longer than you intended?",
    "7. Have you tried to cut down or quit drinking or using drugs but couldn’t?",
    "8. Have you lost interest in activities you used to enjoy because of your drinking or drug use?",
    "9. Have you continued drinking or using drugs even when it was causing problems in your life?",
  ];

  void _submitAnswers() {
    int totalScore = _answers.reduce((a, b) => a + b);
    String addictionType;

    if (totalScore >= 20) {
      addictionType = 'Severe Addiction';
    } else if (totalScore >= 15) {
      addictionType = 'Moderately Severe Addiction';
    } else if (totalScore >= 10) {
      addictionType = 'Moderate Addiction';
    } else if (totalScore >= 5) {
      addictionType = 'Mild Addiction';
    } else {
      addictionType = 'No Addiction';
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddictionResultsPage(
          totalScore: totalScore,
          addictionType: addictionType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Addiction Questionnaire"),
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
