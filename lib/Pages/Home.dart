// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:tollin_go/Feature/emergency.dart';
import 'package:tollin_go/Feature/scan.dart';
import 'package:tollin_go/Services/notify_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

 
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(400.0),
        child: Container(
          height: 140,
          child: AppBar(
            backgroundColor: Colors.blueGrey[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Icon(Icons.account_circle, color: Colors.white, size: 50.0), // Adjust icon properties
                  SizedBox(width: 8.0), // Add some space between the icon and the text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good Morning', style: TextStyle(color: Colors.white, fontSize: 10.0)),
                      Text('Afia Adilah', style: TextStyle(color: Colors.white, fontSize: 12.0)),
                      Text('01859200385', style: TextStyle(color: Colors.white, fontSize: 12.0)),
                    ],
                  ),
                ],
              ),
            ),

            actions: [
              IconButton(
                icon: Icon(Icons.notifications,size: 30.0),
                onPressed: () {
                  // Handle notification icon tap
                },
              ),
              IconButton(
                icon: Icon(Icons.message,size: 30.0),
                onPressed: () {
                  // Handle customer icon tap
                },
              ),
              IconButton(
                icon: Icon(Icons.search,size: 32.0),
                onPressed: () {
                  // Handle search icon tap
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBalanceWidget(), // Include the custom widget here
            SizedBox(height: 4),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                // Rest of the code...
              ],
            ),
            SizedBox(height: 16),
            // New Custom Navigation Area
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blueGrey[400], // Set your desired background color here
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/payment.png',
                          width: 70,
                          height: 70,
                        ),
                        Text('Payment'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/tracking.png',
                          width: 70,
                          height: 70,
                        ),
                        Text('Tracking'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/activity.png',
                          width: 70,
                          height: 70,
                        ),
                        Text('Activity'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/yourtrip.png',
                          width: 70,
                          height: 70,
                        ),
                        Text('YourTrip'),
                      ],
                    ),
                  ),
                  // Add other containers with images and text here...
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/customer service.png',
                          width: 70,
                          height: 70,
                        ),
                        Text('Customer Service'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/setting.png',
                          width: 70,
                          height: 70,
                        ),
                        Text('Settings'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home,size: 30.0),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart,size: 30.0),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.explore,size: 30.0),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.menu,size: 30.0),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add,color:Colors.grey),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


class CustomBalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[400], // Set your desired background color here
      elevation: 4.0, // Adjust elevation as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Main Balance',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set your desired text color
              ),
            ),
            Text(
              '৳3000.00',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set your desired text color
              ),
            ),
            SizedBox(height: 9),
            Text(
              'Valid Till: 25 December 2024',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white, // Set your desired text color
              ),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Set your desired button color
                  ),
                  child: Text(
                    'Recharge',
                    style: TextStyle(color: Colors.blueGrey[600]),
                  ),
                ),
                SizedBox(height: 8), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Set your desired button color
                  ),
                  child: Text(
                    'Emergency Refill',
                    style: TextStyle(color: Colors.blueGrey[600]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class CurvedBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height - 30.0);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 30.0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
