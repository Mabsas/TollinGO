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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400.0),
        child: Container(
          height: 140,
          child: AppBar(
            backgroundColor: Colors.blueGrey[400],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            title: const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Icon(Icons.account_circle, color: Colors.white, size: 50.0),
                  SizedBox(width: 8.0),
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
                icon: const Icon(Icons.notifications, size: 30.0),
                onPressed: () {
                  // Handle notification icon tap
                },
              ),
              IconButton(
                icon: const Icon(Icons.message, size: 30.0),
                onPressed: () {
                  // Handle customer icon tap
                },
              ),
              IconButton(
                icon: const Icon(Icons.search, size: 32.0),
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
            CustomBalanceWidget(),
            const SizedBox(height: 4),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // Rest of the code...
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blueGrey[400],
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey[400],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/payment.png',
                                width: 70,
                                height: 70,
                              ),
                              Text(
                                  'Payment',
                                   style: TextStyle(
                                     color: Colors.black,
                                   ),
                                 ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey[400],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/tracking.png',
                                width: 70,
                                height: 70,
                              ),
                              Text('Tracking',
                                style: TextStyle(
                                  color: Colors.black,
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey[400],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/activity.png',
                                width: 70,
                                height: 70,
                              ),
                              Text('Activity',
                                style: TextStyle(
                                  color: Colors.black,
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey[400],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/yourtrip.png',
                                width: 70,
                                height: 70,
                              ),
                              Text('Your Trip',
                                style: TextStyle(
                                  color: Colors.black,
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey[400],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/customer service.png',
                                width: 70,
                                height: 70,
                              ),
                              Text('Customer Service',
                                style: TextStyle(
                                  color: Colors.black,
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey[400],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/setting.png',
                                width: 70,
                                height: 70,
                              ),
                              Text('Settings',
                                style: TextStyle(
                                  color: Colors.black,
                                ),),
                            ],
                          ),
                        ),
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
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, size: 30.0),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, size: 30.0),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.explore, size: 30.0),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.menu, size: 30.0),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.grey),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomBalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[400],
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Main Balance',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Set your desired button color
              ),
              child: Text(
                '৳3000.00',
                style: TextStyle(color: Colors.blueGrey[600]),
              ),
            ),
            const SizedBox(height: 9),
            const Text(
              'Valid Till: 25 December 2024',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text(
                    'Recharge',
                    style: TextStyle(color: Colors.blueGrey[600]),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    _showEmergencyLoanDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
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

// to display the emergency loan function on pressing the emergency button
  void _showEmergencyLoanDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EmergencyLoanWidget();
      },
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

// The EmergencyLoanWidget remains unchanged
