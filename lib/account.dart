import 'package:flutter/material.dart';
import 'completed_challenges.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _selectedLanguage = 'English';
  String _username = 'Username';

  void _changeLanguage(String? newLanguage) {
    setState(() {
      _selectedLanguage = newLanguage!;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Language changed to English')),
    );
  }

  void _editUsername() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController usernameController = TextEditingController();
        return AlertDialog(
          title: Text('Edit Username'),
          content: TextField(
            controller: usernameController,
            decoration: InputDecoration(hintText: 'Enter new username'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _username = usernameController.text;
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Username updated')),
                );
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _logOut() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
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
                Text(_username, style: TextStyle(fontSize: 18)),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: _editUsername,
                  child: Icon(Icons.edit, size: 16),
                ),
              ],
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Language'),
              trailing: DropdownButton<String>(
                value: _selectedLanguage,
                items: <String>['English']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: _changeLanguage,
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
              onPressed: _logOut,
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Welcome to Login Page'),
      ),
    );
  }
}
