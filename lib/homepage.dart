import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChallengeScreen(),
    );
  }
}

class ChallengeScreen extends StatelessWidget {
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
                  onPressed: () {
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
            SizedBox(height: 200),
            Center(
              child: Text(
                'Empty..',
                style: TextStyle(fontSize: 16, color: Colors.grey),
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
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.notifications, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
          ],
        ),
      ),
    );
  }
}