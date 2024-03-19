import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// Collecting data from database


class DataBaseService {
  static User get user => FirebaseAuth.instance.currentUser!;
  static Future collect_userinfo(
      {required String name,
      required String email,
      required String password}) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .set({"name": name, "email": email, "password": password});
  }
}
