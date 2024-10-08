import 'package:flutter/material.dart';
import 'sign_in_page.dart'; // Import the sign-in page

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _maheIdController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _sos1Controller = TextEditingController();
  final TextEditingController _sos2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the sign-in page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                _buildTextField('Name', _nameController, TextInputType.text),
                const SizedBox(height: 10),
                _buildTextField('Age', _ageController, TextInputType.number,
                    numericOnly: true),
                const SizedBox(height: 10),
                _buildTextField(
                    'Gender', _genderController, TextInputType.text),
                const SizedBox(height: 10),
                _buildTextField(
                    'Mahe ID', _maheIdController, TextInputType.number,
                    numericOnly: true),
                const SizedBox(height: 10),
                _buildTextField(
                    'Course', _courseController, TextInputType.text),
                const SizedBox(height: 10),
                _buildTextField(
                    'Email', _emailController, TextInputType.emailAddress),
                const SizedBox(height: 10),
                _buildTextField(
                    'SOS Number 1', _sos1Controller, TextInputType.phone,
                    numericOnly: true),
                const SizedBox(height: 10),
                _buildTextField(
                    'SOS Number 2', _sos2Controller, TextInputType.phone,
                    numericOnly: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.purple, // Theme color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Add your registration logic here
                      _registerUser();
                      Navigator.pop(
                          context); // Go back to the sign-in page after registration
                    }
                  },
                  child: const Text('Register',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the sign-in page
                  },
                  child: const Text(
                    'Already have an account? Sign In',
                    style: TextStyle(color: Colors.purple), // Theme color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _registerUser() {
    // Here you can handle the registration logic
    // For example, you could save the data to a database or API
    // Example: print("User Registered: ${_nameController.text}");
  }

  Widget _buildTextField(
      String label, TextEditingController controller, TextInputType type,
      {bool numericOnly = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        } else if (numericOnly && !RegExp(r'^\d+$').hasMatch(value)) {
          return 'Please enter a valid $label';
        }
        return null;
      },
    );
  }
}
