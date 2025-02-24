import 'package:flutter/material.dart';

void main() {
  runApp(AgeMilestoneApp());
}

class AgeMilestoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgeCounterScreen(),
    );
  }
}

class AgeCounterScreen extends StatefulWidget {
  @override
  _AgeCounterScreenState createState() => _AgeCounterScreenState();
}

class _AgeCounterScreenState extends State<AgeCounterScreen> {
  int age = 0;

  // Function to determine the milestone message and background color
  Map<String, dynamic> getAgeMilestone(int age) {
    if (age >= 0 && age <= 12) {
      return {'message': "You're a child!", 'color': Colors.lightBlue};
    } else if (age >= 13 && age <= 19) {
      return {'message': "Teenager time!", 'color': Colors.lightGreen};
    } else if (age >= 20 && age <= 30) {
      return {'message': "You're a young adult!", 'color': Colors.yellow};
    } else if (age >= 31 && age <= 50) {
      return {'message': "You're an adult now!", 'color': Colors.orange};
    } else {
      return {'message': "Golden years!", 'color': Colors.grey};
    }
  }

  @override
  Widget build(BuildContext context) {
    var milestone = getAgeMilestone(age);

    return Scaffold(
      backgroundColor: milestone['color'],
      appBar: AppBar(title: Text("Age Milestone Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Age: $age",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              milestone['message'],
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (age > 0) age--; // Decrease age
                    });
                  },
                  child: Text("Decrease"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      age++; // Increase age
                    });
                  },
                  child: Text("Increase"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
