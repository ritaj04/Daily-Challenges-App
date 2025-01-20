import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255), // Light pink background
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);

  void _login(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Validate email
    if (!email.endsWith('@gmail.com')) {
      errorMessage.value = "Please enter your email ";
      return;
    }

    // Validate password
    if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])').hasMatch(password)) {
      errorMessage.value = "Please enter your password ";
      return;
    }

    // Clear error message and proceed with login
    errorMessage.value = null;

    // Add your login functionality here
    // For example, navigate to a different page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email Input
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email or Username*",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20), // Space between inputs

              // Password Input
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password*",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20), // Space between inputs

              // Error Message
              ValueListenableBuilder<String?>(
                valueListenable: errorMessage,
                builder: (context, value, child) {
                  if (value != null) {
                    return Text(
                      value,
                      style: TextStyle(color: Colors.red),
                    );
                  }
                  return SizedBox.shrink(); // Empty space if no error
                },
              ),

              SizedBox(height: 40), // Space between error message and button

              // Log In Button
              ElevatedButton(
                onPressed: () => _login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 166, 226, 240), // Button color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                child: Text("Log in"),
              ),
              SizedBox(height: 20), // Space between button and text
            
              // Sign Up Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      // Add your sign-up functionality here
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: const Color.fromARGB(255, 166, 226, 240)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}