import 'package:flutter/material.dart';
import 'content_page.dart';
import 'content_page2.dart';
import 'content_page3.dart';
import 'content_page4.dart';
import 'content_page5.dart';
import 'meditation_page.dart';
import 'journaling_page.dart';
import 'relaxation_page.dart';
import 'breathing_page.dart';
import 'ask_question_page.dart';
import 'sad_questionnaire_page.dart';
import 'anxiety_questionnaire.dart';
import 'addiction_questionnaire.dart';
import 'make_appointment_page.dart'; // Import for appointment page
import 'notifications_page.dart';
import 'profile_page.dart'; // Import for notification page
import '../widgets/doctor_item.dart';
import '../widgets/specialist_item.dart';
import 'sos_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        currentIndex: _currentIndex,
        onTap: onTabTapped, // Handle tab navigation
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.black54),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined, color: Colors.black54),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Align items to the end
              children: [
                const SizedBox(height: 8), // Add space above the text
                Text(
                  'SOS',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.notifications_none_outlined, color: Colors.black54),
            label: '',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),
                _buildHeader(context), // Pass context here
                const SizedBox(height: 30),
                _buildSelfAssessmentCard(),
                const SizedBox(height: 20),
                _buildHelpButton(),
                const SizedBox(height: 20),
                _buildSpecialistList(),
                const SizedBox(height: 20),
                _buildSkillsHeader(),
                const SizedBox(height: 20),
                _buildDoctorList(),
                const SizedBox(height: 20),
                _buildReachOutSection(), // Reach out section
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to handle navigation for BottomNavigationBar items
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate based on index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const HomePage()), // Navigate to HomePage
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const MakeAppointmentPage()), // Navigate to AppointmentPage
        );
        break;
      case 2:
        // Activate SOS functionality here
        _showSOSDialog(); // Show SOS dialog or functionality
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const NotificationsPage()), // Navigate to NotificationPage
        );
        break;
    }
  }

  // Function to show the SOS confirmation dialog
  void _showSOSDialog() {
    print("Showing SOS dialog");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("SOS Alert"),
          content: const Text(
              "Are you sure you want to notify your emergency contacts that you are in danger?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                print("User    confirmed SOS alert");
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          SOSScreen()), // Navigate to SOS Screen
                );
              },
              child: const Text("Yes, Notify"),
            ),
          ],
        );
      },
    );
  }

  void _sendSOSMessage() {
    // Debug print to check if the method is called
    print("Attempting to send SOS message...");

    // Debug print to confirm the navigation will occur
    print("Navigating to SOSScreen...");

    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
          builder: (context) => SOSScreen()), // Navigate to SOS Screen
    );

    // Additional debug print to confirm the navigation has been triggered
    print("Navigation to SOSScreen triggered.");
  }

  // Header widget
  Row _buildHeader(BuildContext context) {
    // Pass context to the method
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hello,",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              "Mark Joseph",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        InkWell(
          // Make the CircleAvatar clickable
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const ProfilePage()), // Navigate to ProfilePage
            );
          },
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage("assets/pm.png"),
            ),
          ),
        ),
      ],
    );
  }

  // Self-assessment card widget
  Container _buildSelfAssessmentCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 200, 228),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/surgeon.png",
            width: 92,
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "How do you feel?",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const SizedBox(
                width: 120,
                child: Text(
                  "Take a Self assessment right now",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: _showSelfAssessmentOptions,
                child: Container(
                  width: 150,
                  height: 35,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Help button widget
  Container _buildHelpButton() {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      height: 64,
      decoration: BoxDecoration(
        color: const Color.fromARGB(95, 179, 173, 173),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AskQuestionPage(),
            ),
          );
        },
        child: Row(
          children: const [
            Icon(Icons.search, size: 32, color: Colors.black54),
            SizedBox(width: 12),
            Text(
              "How can we help you?",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  // Specialist list widget
  SizedBox _buildSpecialistList() {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildSpecialistItem(
              "assets/clean.png", "Meditation", MeditationPage()),
          const SizedBox(width: 8),
          _buildSpecialistItem(
              "assets/knife.png", "Journaling", JournalingPage()),
          const SizedBox(width: 8),
          _buildSpecialistItem(
              "assets/lungs.png", "Relaxation", RelaxationPage()),
          const SizedBox(width: 8),
          _buildSpecialistItem(
              "assets/hormones.png", "Breathing", BreathingPage()),
        ],
      ),
    );
  }

  // Helper method to create SpecialistItem
  SpecialistItem _buildSpecialistItem(
      String imagePath, String imageName, Widget page) {
    return SpecialistItem(
      imagePath: imagePath,
      imageName: imageName,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  // Skills header widget
  Row _buildSkillsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Skills",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // Doctor list widget
  SizedBox _buildDoctorList() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildDoctorItem(
              "assets/1.png",
              "Study Skills",
              "Improve your focus and retention",
              ContentPage(
                title: "Study Skills",
                description:
                    "Learn various methods to improve your study skills.",
              )),
          _buildDoctorItem(
              "assets/2.png",
              "Coping Skills",
              "Learn ways to handle stress",
              ContentPage2(
                title: "Coping Skills",
              )),
          _buildDoctorItem(
              "assets/3.png",
              "Social Skills",
              "Enhance your communication skills",
              ContentPage3(
                title: "Social Skills",
              )),
          _buildDoctorItem(
              "assets/4.png",
              "Relationship Issues",
              "Build stronger connections",
              ContentPage4(
                title: "Relationship Issues",
              )),
          _buildDoctorItem(
              "assets/5.png",
              "Sleep Hygiene",
              "Improve your sleep quality",
              ContentPage5(
                title: "Sleep Issues",
              )),
        ],
      ),
    );
  }

  // Helper method to create DoctorItem
  DoctorItem _buildDoctorItem(
      String image, String name, String specialist, Widget page) {
    return DoctorItem(
      image: image,
      name: name,
      specialist: specialist,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  // Function to show self-assessment options
  void _showSelfAssessmentOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("How are you feeling?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _startQuestionnaire("I am Sad");
                },
                child: const Text("I am Sad"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _startQuestionnaire("I am Anxious");
                },
                child: const Text("I am Anxious"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _startQuestionnaire("I am Addicted");
                },
                child: const Text("I am Addicted"),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to start questionnaire based on the user's choice
  void _startQuestionnaire(String mood) {
    Widget page;
    switch (mood) {
      case "I am Sad":
        page = SadQuestionnairePage();
        break;
      case "I am Anxious":
        page = AnxietyQuestionnairePage();
        break;
      case "I am Addicted":
        page = AddictionQuestionnairePage();
        break;
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  // Reach out section
  Widget _buildReachOutSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Reach Out for Help",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "If you're in crisis or need support, please reach out to a mental health professional.",
            style: TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 8),
          const Text(
            "You can contact:\n- Your local emergency services\n- Mental health helplines\n- Professional counseling services",
            style: TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 8),
          const Text(
            "Here are some useful links:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          SelectableText(
            "1. National Suicide Prevention Lifeline: 988",
            style: TextStyle(color: Colors.blue),
          ),
          const SizedBox(height: 4),
          SelectableText(
            "2. Link to information about department of clinical psychology: https://khmanipal.com/clinicalpsychology/",
            style: TextStyle(color: Colors.blue),
          ),
          const SizedBox(height: 4),
          SelectableText(
            "3. Professional Help: https://khmanipal.com/",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
