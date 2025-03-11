import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice_firebase/HomePage.dart';

class Showemail extends StatefulWidget {
  final String name;
  final String email;
  const Showemail({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<Showemail> createState() => _ShowemailState();
}

class _ShowemailState extends State<Showemail> {
  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              logout();
            
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(),
                ),
                (route) => false,
              );
            },
            child: Text("log out"),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Name: ${widget.name}")),
          SizedBox(height: 10),
          Center(child: Text("email: ${widget.email}")),
        ],
      ),
    );
  }
}
