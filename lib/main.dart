// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tollin_go/Feature/paid.dart';
import 'package:tollin_go/Feature/scan.dart';
import 'package:tollin_go/Introduction/screenview.dart';
import 'package:tollin_go/Introduction/splash.dart';
import 'dart:io';
import 'package:tollin_go/Pages/Home.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDaBuAMW1Nw19jfRMpvwRSZyrXoV5yxz6w",
              appId: "1:907270160676:android:c2f3293b3fedb3a4bdf3b1",
              messagingSenderId: "907270160676",
              projectId: "tollingo-85e82"),
        )
      : await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Splash(),
  ));
}
