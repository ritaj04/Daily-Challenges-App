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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              

              // Log In Button
              ElevatedButton(
                onPressed: () {
                  // Add your login functionality here
                },
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