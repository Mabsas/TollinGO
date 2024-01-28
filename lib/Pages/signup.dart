// ignore_for_file: use_build_context_synchronously, unused_local_variable, unnecessary_null_comparison, duplicate_ignore, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tollin_go/Feature/scan.dart';
import 'package:tollin_go/Pages/Home.dart';
import 'package:tollin_go/Pages/login.dart';
import 'package:tollin_go/Services/database.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";

  // for getting the data that user is giving through this controller
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();

  /* Validity check kore of the contents of the form. It helps in checking if the user has filled out the required information (name, email, password) before allowing any action, like submitting the form.*/

  final _formkey = GlobalKey<FormState>();

  // execution of signupbutton
  Future registration() async {
    if (password != null) {
      try {
        //represents the user info that has just been registered
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        //Snackbar use kore to show popup message ta jeta user dekhbe & scaffold messenger is the widget that provides that facility
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color.fromARGB(255, 82, 245, 57),
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            )));
        // ignore: use_build_context_synchronously
        //Navigator.push use kore for moving from one page to another
        /*
 e.code refer kore the error code related to FirebaseAuthException that is caught in the catch block. The FirebaseAuthException is an exception class provided by the Firebase Authentication library for Dart/Flutter.*/
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      userBalance:
                          500, // You can replace this with the actual user information
                      userName: name,
                      userEmail: email,
                    ))); //HOME
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Color.fromARGB(255, 244, 182, 75),
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Color.fromARGB(255, 244, 182, 75),
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 55, 147, 1),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            //validity of users info
            key: _formkey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 120.0, left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello...!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontFamily: 'OriginalSurfer'),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(76, 89, 165, 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          showCursor: true,
                          controller: namecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Colors.white,
                              ),
                              hintText: 'Your Name',
                              hintStyle: TextStyle(color: Colors.white60),
                              errorStyle: TextStyle(color: Colors.yellow)),
                          style: const TextStyle(
                              color: Colors.white), //written by user text color
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(76, 89, 165, 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          showCursor: true,
                          controller: mailcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter E-mail';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              hintText: 'Your E-mail',
                              hintStyle: TextStyle(color: Colors.white60),
                              errorStyle: TextStyle(color: Colors.yellow)),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(76, 89, 165, 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          showCursor: true,
                          cursorColor: Colors.black,
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.password_outlined,
                                color: Colors.white,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white60),
                              errorStyle: TextStyle(color: Colors.yellow)),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 80.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                              name = namecontroller.text;
                              password = passwordcontroller.text;
                            });
                          }
                          await registration();
                          DataBaseService.collect_userinfo(name: namecontroller.text, email: mailcontroller.text, password: passwordcontroller.text);
                        },
                        child: Center(
                          child: Container(
                            width: 150,
                            height: 55,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(249, 95, 59, 1),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                                child: Text(
                              "Signup",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /*This line sets the height of the SizedBox to one-sixth (1/6) of the device's screen height. The MediaQuery.of(context).size.height gets the total height of the device's screen, and dividing it by 6 provides a fraction of that height.*/
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/Authen/redoval.png",
                      height: 130,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                    const Spacer(),
                    const Text(
                      "Already Have Account?",
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(
                              color: Color.fromRGBO(249, 95, 59, 1),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )),
                    const Spacer(),
                    Image.asset(
                      "assets/Authen/design.png",
                      height: 130,
                      width: 70,
                      fit: BoxFit.fill,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
