import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialLoginPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255), // Light pink background
      ),
    );
  }
}

class InitialLoginPage extends StatelessWidget {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
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

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<String?> emailError = ValueNotifier<String?>(null);
  final ValueNotifier<String?> passwordError = ValueNotifier<String?>(null);

  void _login(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Reset error messages
    emailError.value = null;
    passwordError.value = null;

    // Validate email
    if (!email.endsWith('@gmail.com')) {
      emailError.value = "Please enter your email ";
    }

    // Validate password
    if (password.isEmpty || !RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])').hasMatch(password)) {
      passwordError.value = "Please enter your password ";
    }

    // Proceed if there are no errors
    if (emailError.value == null && passwordError.value == null) {
      // Add your login functionality here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
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
              ValueListenableBuilder<String?>(
                valueListenable: emailError,
                builder: (context, value, child) {
                  return value != null
                      ? Text(
                          value,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        )
                      : SizedBox.shrink();
                },
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
              ValueListenableBuilder<String?>(
                valueListenable: passwordError,
                builder: (context, value, child) {
                  return value != null
                      ? Text(
                          value,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        )
                      : SizedBox.shrink();
                },
              ),
              SizedBox(height: 20), // Space between inputs

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
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

class SignUpPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<String?> firstNameError = ValueNotifier<String?>(null);
  final ValueNotifier<String?> lastNameError = ValueNotifier<String?>(null);
  final ValueNotifier<String?> emailError = ValueNotifier<String?>(null);
  final ValueNotifier<String?> passwordError = ValueNotifier<String?>(null);

  void _signUp(BuildContext context) {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Reset error messages
    firstNameError.value = null;
    lastNameError.value = null;
    emailError.value = null;
    passwordError.value = null;

    // Validate inputs
    if (firstName.isEmpty) {
      firstNameError.value = "Please enter your first name";
    }
    if (lastName.isEmpty) {
      lastNameError.value = "Please enter your last name";
    }
    if (!email.endsWith('@gmail.com')) {
      emailError.value = "Please enter your email";
    }
    if (password.isEmpty) {
      passwordError.value = "Please enter your password";
    }

    // Proceed if there are no errors
    if (firstNameError.value == null &&
        lastNameError.value == null &&
        emailError.value == null &&
        passwordError.value == null) {
      // Add your sign-up functionality here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
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
              // First Name Input
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                ),
              ),
              ValueListenableBuilder<String?>(
                valueListenable: firstNameError,
                builder: (context, value, child) {
                  return value != null
                      ? Text(
                          value,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        )
                      : SizedBox.shrink();
                },
              ),
              SizedBox(height: 20), // Space between inputs

              // Last Name Input
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(),
                ),
              ),
              ValueListenableBuilder<String?>(
                valueListenable: lastNameError,
                builder: (context, value, child) {
                  return value != null
                      ? Text(
                          value,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        )
                      : SizedBox.shrink();
                },
              ),
              SizedBox(height: 20), // Space between inputs

              // Email Input
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email*",
                  border: OutlineInputBorder(),
                ),
              ),
              ValueListenableBuilder<String?>(
                valueListenable: emailError,
                builder: (context, value, child) {
                  return value != null
                      ? Text(
                          value,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        )
                      : SizedBox.shrink();
                },
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
              ValueListenableBuilder<String?>(
                valueListenable: passwordError,
                builder: (context, value, child) {
                  return value != null
                      ? Text(
                          value,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        )
                      : SizedBox.shrink();
                },
              ),
              SizedBox(height: 20), // Space between inputs

              SizedBox(height: 40), // Space between error message and button

              // Sign Up Button
              ElevatedButton(
                onPressed: () => _signUp(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 166, 226, 240), // Button color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                child: Text("Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}