import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        scaffoldBackgroundColor: Colors.white,
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 166, 226, 240),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Log in"),
              ),
              SizedBox(height: 20),
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
                      style: TextStyle(color: Color.fromARGB(255, 166, 226, 240)),
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

    emailError.value = null;
    passwordError.value = null;

    if (!email.endsWith('@gmail.com')) {
      emailError.value = "Please enter your email";
    }

    if (password.isEmpty || !RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])').hasMatch(password)) {
      passwordError.value = "Please enter your password";
    }

    if (emailError.value == null && passwordError.value == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChallengeScreen()),
      );
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
                      ? Text(value, style: TextStyle(color: Colors.red, fontSize: 12))
                      : SizedBox.shrink();
                },
              ),
              SizedBox(height: 20),
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
                      ? Text(value, style: TextStyle(color: Colors.red, fontSize: 12))
                      : SizedBox.shrink();
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 166, 226, 240),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Log in"),
              ),
              SizedBox(height: 20),
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
                      style: TextStyle(color: Color.fromARGB(255, 166, 226, 240)),
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

    firstNameError.value = null;
    lastNameError.value = null;
    emailError.value = null;
    passwordError.value = null;

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

    if (firstNameError.value == null && lastNameError.value == null && emailError.value == null && passwordError.value == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChallengeScreen()),
      );
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
                      ? Text(value, style: TextStyle(color: Colors.red, fontSize: 12))
                      : SizedBox.shrink();
                },
              ),
              SizedBox(height: 20),
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
                      ? Text(value, style: TextStyle(color: Colors.red, fontSize: 12))
                      : SizedBox.shrink();
                },
              ),
              SizedBox(height: 20),
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
                      ? Text(value, style: TextStyle(color: Colors.red, fontSize: 12))
                      : SizedBox.shrink();
                },
              ),
              SizedBox(height: 20),
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
                      ? Text(value, style: TextStyle(color: Colors.red, fontSize: 12))
                      : SizedBox.shrink();
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _signUp(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 166, 226, 240),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
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

class ChallengeScreen extends StatefulWidget {
  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  List<Challenge> challenges = [];

  void addChallenge(Challenge challenge) {
    setState(() {
      challenges.add(challenge);
    });
  }

  void updateChallenge(int index, Challenge updatedChallenge) {
    setState(() {
      challenges[index] = updatedChallenge;
    });
  }

  void removeChallenge(int index) {
    setState(() {
      challenges.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Center(
              child: Text(
                'Challenges',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 90),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    final newChallenge = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPage()),
                    );
                    if (newChallenge != null) {
                      addChallenge(newChallenge);
                    }
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    backgroundColor: Color(0xFFADD8E6),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Add a new challenge',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.black, thickness: 1),
            SizedBox(height: 20),
            Expanded(
              child: challenges.isEmpty
                  ? Center(child: Text('No challenges added yet.', style: TextStyle(fontSize: 16, color: Colors.grey)))
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: challenges.length,
                      itemBuilder: (context, index) {
                        final challenge = challenges[index];
                        return Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Title: ${challenge.title}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text('Description: ${challenge.description}', style: TextStyle(fontSize: 14)),
                              Text('Date: ${challenge.day}-${challenge.month}-${challenge.year}', style: TextStyle(fontSize: 12, color: Colors.grey)),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () async {
                                      final updatedChallenge = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewPage(challenge: challenge),
                                        ),
                                      );
                                      if (updatedChallenge != null) {
                                        updateChallenge(index, updatedChallenge);
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.close, color: Colors.red),
                                    onPressed: () {
                                      removeChallenge(index);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFADD8E6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // Home action
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 2,
              color: Color(0xFFADD8E6),
              width: double.infinity,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 166, 226, 240),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Remember you can do it',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController usernameController = TextEditingController();
  bool isEditingUsername = false;

  @override
  void initState() {
    super.initState();
    usernameController.text = "Username"; // Set default username
  }

  void toggleEdit() {
    setState(() {
      isEditingUsername = !isEditingUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Color(0xFFADD8E6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 40, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isEditingUsername
                    ? Expanded(
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter username',
                          ),
                        ),
                      )
                    : Text(usernameController.text, style: TextStyle(fontSize: 18)),
                SizedBox(width: 4),
                IconButton(
                  icon: Icon(isEditingUsername ? Icons.check : Icons.edit, size: 16),
                  onPressed: toggleEdit,
                ),
              ],
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Language'),
              trailing: DropdownButton<String>(
                value: 'English',
                items: <String>['English', 'Arabic']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle language change
                  if (newValue == 'Arabic') {
                    // Implement localization or state management for Arabic
                  }
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Completed Challenges'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompletedChallengesScreen(),
                  ),
                );
              },
            ),
            Spacer(),
            TextButton(
              onPressed: () {Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => InitialLoginPage()),
                );
              },
              child: Text(
                'Log out',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatefulWidget {
  final Challenge? challenge;

  NewPage({this.challenge});

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  String? titleError;
  String? timeError;

  @override
  void initState() {
    super.initState();
    if (widget.challenge != null) {
      titleController.text = widget.challenge!.title;
      descriptionController.text = widget.challenge!.description;
      selectedDay = widget.challenge!.day;
      selectedMonth = widget.challenge!.month;
      selectedYear = widget.challenge!.year;
    }
  }

  void validateInputs() {
    setState(() {
      titleError = titleController.text.isEmpty ? '*Please add a title' : null;

      bool isDayEmpty = selectedDay == null;
      bool isMonthEmpty = selectedMonth == null;
      bool isYearEmpty = selectedYear == null;

      timeError = (isDayEmpty || isMonthEmpty || isYearEmpty) 
          ? '*Please complete the date' 
          : null;
    });

    if (titleError == null && timeError == null) {
      Challenge newChallenge = Challenge(
        title: titleController.text,
        description: descriptionController.text,
        day: selectedDay!,
        month: selectedMonth!,
        year: selectedYear!,
      );

      Navigator.pop(context, newChallenge);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 530,
          width: 350,
          decoration: BoxDecoration(
            color: Color(0xFFADD8E6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Title:',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    errorText: titleError,
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 20),
                Text(
                  'Description:',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 20),
                Text(
                  'Time:',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedDay,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        hint: Text('Day'),
                        items: List.generate(31, (index) => (index + 1).toString())
                            .map((day) => DropdownMenuItem(value: day, child: Text(day)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDay = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedMonth,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        hint: Text('Month'),
                        items: List.generate(12, (index) => (index + 1).toString())
                            .map((month) => DropdownMenuItem(value: month, child: Text(month)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMonth = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedYear,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        hint: Text('Year'),
                        items: List.generate(11, (index) => (2025 + index).toString())
                            .map((year) => DropdownMenuItem(value: year, child: Text(year)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedYear = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                if (timeError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                    child: Center(
                      child: Text(
                        timeError!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                SizedBox(height: 25),
                Center(
                  child: ElevatedButton(
                    onPressed: validateInputs,
                    child: Text('Add', style: TextStyle(color: Colors.blue)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Challenge {
  String title;
  String description;
  String day;
  String month;
  String year;

  Challenge({
    required this.title,
    required this.description,
    required this.day,
    required this.month,
    required this.year,
  });
}

class CompletedChallengesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Challenges'),
      ),
      body: Center(
        child: Text('No completed challenges yet.'),
      ),
    );
  }
}