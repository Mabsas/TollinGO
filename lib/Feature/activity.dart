import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100], // Change this to the desired background color
      appBar: AppBar(
        title: Text(
          'Activity',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '4:20 PM',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Money Sent to Bridge Authority'),
            SizedBox(height: 16),
            Text(
              '9:26 AM',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Toll Payment - Bridge 1'),
            Text('৳30.00'),
            SizedBox(height: 8),
            Text(
              'Jan 28, 2024,10:35 PM',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Toll Payment - Bridge 2'),
            Text('৳30.00'),
            SizedBox(height: 16),
            Text(
              'Jan 27, 2024,3.40 PM',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Toll Payment - Bridge 3'),
            Text('৳30.00'),

            SizedBox(height: 16),

            SizedBox(height: 360),
            Text(
              'Activity history is available for the last 30 days only. Information may take some time to update.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
