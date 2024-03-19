// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tollin_go/Feature/add_money.dart';
import 'package:tollin_go/Feature/emergency.dart';
import 'package:tollin_go/Feature/scan.dart';
import 'package:tollin_go/Introduction/screenview.dart';
import 'package:tollin_go/Pages/login.dart';
import 'package:tollin_go/Pages/signout.dart';
import 'package:tollin_go/Services/Tracking.dart';
import 'package:tollin_go/Services/chat.dart';
import 'package:tollin_go/Services/database.dart';
import 'package:tollin_go/Services/notify_service.dart';
import 'package:tollin_go/Services/notification_page.dart';
import 'package:tollin_go/Services/customer_service.dart';
import 'package:tollin_go/Services/edit_profile.dart';
import 'package:tollin_go/Feature/activity.dart';
import 'package:tollin_go/Feature/yourTrip.dart';

class Home extends StatefulWidget {
  final double userBalance;
  final String userName;
  final String userEmail;

  const Home({
    Key? key,
    required this.userBalance,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState(
        userBalance: userBalance,
        userName: userName,
        userEmail: userEmail,
      );
}

class _HomeState extends State<Home> {
  double userBalance;
  String name;

  _HomeState(
      {required this.userBalance,
      required String userName,
      required String userEmail})
      : name = userName;

  void _updateUserBalance(double addedMoney) {
    double updatedBalance = userBalance + addedMoney;
    setState(() {
      userBalance = updatedBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400.0),
        child: Container(
          height: 140,
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blueGrey[400],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.account_circle,
                        color: Colors.white, size: 40.0),
                    onPressed: () {
                      // Navigate to the NotificationPage when the icon is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                    },
                  ), // Adjust icon properties
                  SizedBox(width: 8.0),

                  //Reading from database
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(DataBaseService.user.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /*Text('Good Morning',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.0)),*/
                              Text(snapshot.data!["name"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0)),
                              Text(snapshot.data!["email"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0)),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }) // upto here
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications, size: 30.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                  // Handle notification icon tap
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
            CustomBalanceWidget(
              userBalance: userBalance,
              onMoneyAdded: _updateUserBalance,
            ),
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
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _navigateToScanner(context);
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
                              const Text(
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
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Track()),
                            );
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
                              const Text(
                                'Tracking',
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
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Activity()),
                            );
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
                              const Text(
                                'Activity',
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
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomizeYourPlan()),
                            );
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
                              const Text(
                                'Your Trip',
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
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerService()),
                            );
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
                              const Text(
                                'Customer Service',
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
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _showSettingsMenu(context);
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
                              const Text(
                                'Settings',
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
              icon: const Icon(Icons.message, size: 30.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => chat(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screenview(),
            ),
          );
        },
        child: Container(
          width: 80.0, // Adjust the width as needed
          height: 80.0, // Adjust the height as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // Set background color if needed
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              'assets/images/aboutus.png', // Replace with the path to your image file with transparent background
              width: 80.0,
              height: 80.0,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomBalanceWidget extends StatelessWidget {
  final double userBalance;
  final Function(double) onMoneyAdded;

  const CustomBalanceWidget({
    Key? key,
    required this.userBalance,
    required this.onMoneyAdded,
  }) : super(key: key);

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
                '৳${userBalance.toStringAsFixed(2)}',
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
                  onPressed: () {
                    _AddMoneyDialog(context);
                  },
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

// Add money feature
  void _AddMoneyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddMoneyScreen(
          onMoneyAdded: onMoneyAdded, // Pass the callback to AddMoneyScreen
        );
      },
    );
  }

// to display the emergency loan function on pressing the emergency button
  void _showEmergencyLoanDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const EmergencyLoanWidget();
      },
    );
  }
}

//for the scanner function
void _navigateToScanner(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scanner(
        userBalance: 0.00,
      ),
    ),
  );
}

//customer service
void _navigateToChatScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => chat(),
    ),
  );
}

class CurvedBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height - 30.0);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30.0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

void logout() {
  final _auth = AuthService();
  _auth.signOut();
}

void _showSettingsMenu(BuildContext context) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  showMenu(
    context: context,
    position: RelativeRect.fromRect(
      Rect.fromPoints(
        overlay.localToGlobal(Offset.zero),
        overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
      ),
      Offset.zero & overlay.size,
    ),
    items: [
      PopupMenuItem(
        child: ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            logout();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LogIn(),
              ),
            );
          },
        ),
      ),
    ],
  );
}
