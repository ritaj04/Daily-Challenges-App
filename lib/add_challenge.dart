import 'package:flutter/material.dart';

void main() {
  runApp(AddChallengeApp());
}

class AddChallengeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewPage(),
    );
  }
}

class NewPage extends StatefulWidget {
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

  void validateInputs() {
    setState(() {
      titleError = titleController.text.isEmpty ? '*Please add a title' : null;

      bool isDayEmpty = selectedDay == null;
      bool isMonthEmpty = selectedMonth == null;
      bool isYearEmpty = selectedYear == null;

      timeError = (isDayEmpty | isMonthEmpty | isYearEmpty)
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

      Navigator.pop(context, newChallenge); // Return the new challenge
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 450,
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
                Text('Title:',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    errorText: titleError,
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 20),
                Text('Description:',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 20),
                Text('Date:',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedDay,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        hint: Text('Day'),
                        items: List.generate(
                                31, (index) => (index + 1).toString())
                            .map((day) =>
                                DropdownMenuItem(value: day, child: Text(day)))
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        hint: Text('Month'),
                        items:
                            List.generate(12, (index) => (index + 1).toString())
                                .map((month) => DropdownMenuItem(
                                    value: month, child: Text(month)))
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        hint: Text('Year'),
                        items: List.generate(
                                11, (index) => (2025 + index).toString())
                            .map((year) => DropdownMenuItem(
                                value: year, child: Text(year)))
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
                        child: Text(timeError!,
                            style: TextStyle(color: Colors.red))),
                  ),
                SizedBox(height: 25),
                Center(
                  child: ElevatedButton(
                    onPressed: validateInputs,
                    child: Text('Add', style: TextStyle(color: Colors.blue)),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFADD8E6), // اللون الأزرق الفاتح
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: '',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {},
          backgroundColor: Color(0xFFADD8E6), // اللون الأزرق الفاتح
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
