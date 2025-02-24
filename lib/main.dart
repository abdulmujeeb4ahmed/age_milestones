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
  double age = 0; // Age stored as double for slider

  // Function to determine the milestone message and background color
  Map<String, dynamic> getAgeMilestone(double age) {
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

  // Function to get progress bar color
  Color getProgressColor(double age) {
    if (age <= 33) return Colors.green;
    if (age <= 67) return Colors.yellow;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    var milestone = getAgeMilestone(age);

    return Scaffold(
      backgroundColor: milestone['color'],
      appBar: AppBar(
        title: Text("Age Milestone Counter"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Age: ${age.toInt()}",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                milestone['message'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),

            // Age Slider
            Slider(
              value: age,
              min: 0,
              max: 99,
              divisions: 99,
              label: age.toInt().toString(),
              activeColor: Colors.white,
              inactiveColor: Colors.grey[700],
              onChanged: (newValue) {
                setState(() {
                  age = newValue;
                });
              },
            ),

            SizedBox(height: 20),

            // Increment & Decrement Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (age > 0) age--;
                    });
                  },
                  child: Icon(Icons.remove),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (age < 99) age++;
                    });
                  },
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressIndicator(
                value: age / 99,
                color: getProgressColor(age),
                backgroundColor: Colors.grey[300],
                minHeight: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
