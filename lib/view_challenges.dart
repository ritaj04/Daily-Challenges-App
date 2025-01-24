import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChallengeDetailsPage(
        title: ' ',
        description: ' ',
        day: ' ',
        month: ' ',
        year: ' ',
      ),
    );
  }
}

class ChallengeDetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final String day;
  final String month;
  final String year;

  ChallengeDetailsPage({
    required this.title,
    required this.description,
    required this.day,
    required this.month,
    required this.year,
  });

  @override
  _ChallengeDetailsPageState createState() => _ChallengeDetailsPageState();
}

class _ChallengeDetailsPageState extends State<ChallengeDetailsPage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dayController;
  late TextEditingController monthController;
  late TextEditingController yearController;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
    dayController = TextEditingController(text: widget.day);
    monthController = TextEditingController(text: widget.month);
    yearController = TextEditingController(text: widget.year);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }

  void navigateToAddChallenge() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewChallengePage(
          title: titleController.text,
          description: descriptionController.text,
          day: dayController.text,
          month: monthController.text,
          year: yearController.text,
        ),
      ),
    ).then((result) {
      if (result != null) {
        setState(() {
          titleController.text = result.title;
          descriptionController.text = result.description;
          dayController.text = result.day;
          monthController.text = result.month;
          yearController.text = result.year;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.lightBlue[100],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title:',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                isEditing
                    ? TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder()))
                    : Text(titleController.text),
                SizedBox(height: 5),
                Text('Description:', style: TextStyle(fontSize: 16)),
                isEditing
                    ? TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder()))
                    : Text(descriptionController.text),
                SizedBox(height: 5),
                Text('Date:',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Row(
                  children: [
                    isEditing
                        ? Expanded(
                            child: TextField(
                              controller: dayController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  hintText: 'D'),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        : Expanded(child: Text(dayController.text)),
                    SizedBox(width: 5),
                    isEditing
                        ? Expanded(
                            child: TextField(
                              controller: monthController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  hintText: 'M'),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        : Expanded(child: Text(monthController.text)),
                    SizedBox(width: 5),
                    isEditing
                        ? Expanded(
                            child: TextField(
                              controller: yearController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  hintText: 'Y'),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        : Expanded(child: Text(yearController.text)),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(isEditing
                            ? Icons.check
                            : Icons
                                .edit), // تغيير الأيقونة بناءً على حالة التعديل
                        onPressed: () {
                          if (isEditing) {
                            // Save changes if editing
                            setState(() {
                              isEditing = false; // Stop editing
                            });
                          } else {
                            navigateToAddChallenge(); // Navigate to add challenge page
                          }
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.close,
                            color: Colors.red), // لون الأيقونة الأحمر
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue[200], // اللون الأزرق الفاتح
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.home, color: Colors.white), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class NewChallengePage extends StatelessWidget {
  final String title;
  final String description;
  final String day;
  final String month;
  final String year;

  NewChallengePage({
    required this.title,
    required this.description,
    required this.day,
    required this.month,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    // هنا يمكنك وضع واجهة إضافة التحدي
    return Scaffold();
  }
}
