import 'package:flutter/material.dart';
import 'package:tollin_go/Services/create_complain.dart';
import 'package:tollin_go/Services/feedback.dart';
import 'package:tollin_go/Services/chat.dart';

class CustomerService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100], // Change this to the desired background color
      appBar: AppBar(
        title: Text(
          'Customer Service',
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
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add an Image widget before the text widgets
            Image.asset(
              'assets/images/Cservice.png',
              width: 500.0,
              height: 300.0,
            ),

            SizedBox(height:10),
            Text(
              "How May We Help You Today?",
              style: TextStyle(fontSize: 20,color: Colors.black54),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => chat()),
                    );
                    // handle register a complaint
                    print("Register a Complaint");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[300], // Change this to the desired color
                    onPrimary: Colors.white,
                  ),
                  child: Text("Register a Complaint"),
                ),

                ElevatedButton(
                  onPressed: () {

                    // handle check complaint status
                    print("Check Complaint Status");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[300], // Change this to the desired color
                    onPrimary: Colors.white,
                  ),
                  child: Text("Check Complaint Status"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackPage()),
                    );
                    // handle check complaint status
                    print("Feedback & Suggestions");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[300], // Change this to the desired color
                    onPrimary: Colors.white,
                  ),
                  child: Text("Feedback & Suggestions"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
