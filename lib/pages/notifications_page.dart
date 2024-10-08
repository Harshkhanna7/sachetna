import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNotificationItem("Your appointment with Dr. Smith is confirmed for 5 PM."),
            _buildNotificationItem("Complete your self-assessment to track progress."),
            _buildNotificationItem("Remember to meditate for 10 minutes today."),
          ],
        ),
      ),
    );
  }

  // Notification item widget
  Widget _buildNotificationItem(String message) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(message, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
