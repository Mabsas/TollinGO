import 'package:flutter/material.dart';


class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('Feedback & Suggestions',
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
              'Your Feedback',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your opinion matters! If you have any feedback or suggestions for us which will help us improve our services, please share them in the form below.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter your feedback here...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle feedback submission here
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}