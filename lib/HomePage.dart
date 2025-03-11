import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice_firebase/showEmail.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  googleLogin() async {
    print("login succesful");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();
      if (result == null) {
        return;
      }
      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: userData.accessToken,
        idToken: userData.idToken,
      );
      var finalresult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $result");
      print(result.displayName);
      print(result.email);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Showemail(
              email: result.email,
              name: result.displayName!,
            ),
          ));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("project firebase google login page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            googleLogin();
          },
          child: Text("Google loing"),
        ),
      ),
    );
  }
}
