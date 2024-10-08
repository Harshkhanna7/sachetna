import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter/services.dart'; // Import for MethodChannel

class SOSScreen extends StatelessWidget {
  static const platform = MethodChannel('sendSms');

  const SOSScreen({super.key}); // Define MethodChannel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send SOS Emergency SMS"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Only one button now, renamed to SOS Emergency
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.primary, // Set button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "SOS Emergency", // Renamed button
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: () {
                  sendSms(); // Call the sendSms method
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to send SMS
  Future<void> sendSms() async {
    for (String phone in recipients) {
      try {
        final String result =
            await platform.invokeMethod('send', <String, dynamic>{
          "phone": phone, // Send to each recipient
          "msg": "SOS Emergency" // Message to send
        });
        print(result);
      } on PlatformException catch (e) {
        print(e.toString());
      }
    }
  }
}

// Updated recipients list with the specified phone numbers
List<String> recipients = [
  "+919412409670",
  "+919528904182",
  "+918368646970",
  "+918117052973"
];
