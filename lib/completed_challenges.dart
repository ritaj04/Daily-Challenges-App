import 'package:flutter/material.dart';

class CompletedChallengesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Challenges'),
      ),
      body: Center(
        child: Text('List of completed challenges will appear here.'),
      ),
    );
  }
}
