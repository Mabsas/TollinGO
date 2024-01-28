// ignore_for_file: unnecessary_new, use_build_context_synchronously, avoid_unnecessary_containers, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tollin_go/Feature/scan.dart';
import 'package:tollin_go/Pages/Home.dart';
import 'package:tollin_go/Pages/forgetpassword.dart';
import 'package:tollin_go/Pages/signup.dart';
import 'package:tollin_go/Services/database.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "", name = "";

  final _formkey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();
  //TextEditingController confirmuserpasswordcontroller = TextEditingController();

  Future userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    userBalance: 500,
                    userName: name,
                    userEmail: email,
                  ))); //hOME
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "No User Found for that Email",
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Wrong Password Provided by User",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 55, 147),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/Authen/above1.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.9,
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Welcome\nBack",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34.0,
                        fontFamily: 'OriginalSurfer'),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(76, 89, 165, 1),
                      borderRadius: BorderRadius.circular(22)),
                  child: TextFormField(
                    showCursor: true,
                    cursorColor: Colors.black,
                    controller: useremailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter E-Mail';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintText: 'Your Email',
                        hintStyle: TextStyle(color: Colors.white60),
                        errorStyle: TextStyle(color: Colors.yellow)),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: const Color(0xFF4c59a5),
                      borderRadius: BorderRadius.circular(22)),
                  child: TextFormField(
                    showCursor: true,
                    cursorColor: Colors.black,
                    controller: userpasswordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.white,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white60),
                      errorStyle: TextStyle(color: Colors.yellow),
                    ),
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 24.0),
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formkey.currentState!.validate()) {
                      // Check if passwords match
                      if (userpasswordcontroller.text !=
                              userpasswordcontroller.text ||
                          useremailcontroller.text !=
                              useremailcontroller.text) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Color.fromARGB(255, 246, 29, 14),
                          content: Text(
                            "Incorrect email or password!",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ));
                        return; // Stop the login process if passwords don't match
                      }

                      setState(() {
                        email = useremailcontroller.text;
                        password = userpasswordcontroller.text;
                        name = usernamecontroller.text;
                      });
                    }
                    await userLogin();

                    DataBaseService.collect_userinfo(
                        name: usernamecontroller.text,
                        email: useremailcontroller.text,
                        password: userpasswordcontroller.text);
                  },
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 55,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xFFf95f3b),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                          child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New User?",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: const Text(
                          " Signup",
                          style: TextStyle(
                              color: Color(0xFFf95f3b),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ))
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
