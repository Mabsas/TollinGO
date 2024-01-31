import 'package:flutter/material.dart';

class CustomizeYourPlan extends StatefulWidget {
  @override
  _CustomizeYourPlanState createState() => _CustomizeYourPlanState();
}

class _CustomizeYourPlanState extends State<CustomizeYourPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Your Trip',
          style: TextStyle(fontSize: 17.0, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[300],
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70.0),
            bottomRight: Radius.circular(70.0),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/trip.png', // Replace with your image path
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              "Plan your trip here!",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourTripPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
              ),
              child: Text(
                "Make your plan",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Define the YourTripPage widget for the next page
class YourTripPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Your Trip',
          style: TextStyle(fontSize: 17.0, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[300],
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70.0),
            bottomRight: Radius.circular(70.0),
          ),
        ),
      ),
      body: Center(
        child: Text("This is Your Trip Page"),
      ),
    );
  }
}
