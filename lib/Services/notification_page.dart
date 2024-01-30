import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 17.0, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[300],
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70.0),
            bottomRight: Radius.circular(70.0),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                // Add your notification icon press logic here
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white54,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                'No notifications for you!',
                style: TextStyle(fontSize: 20.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
