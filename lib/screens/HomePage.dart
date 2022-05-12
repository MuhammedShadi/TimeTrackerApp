import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timetracker/fireBase/fireBaseMethods.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,required this.onSignOut}) : super(key: key);
  final VoidCallback onSignOut;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final AuthBase _fireBaseMethods = AuthBase();

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      widget.onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          MaterialButton(
            onPressed: () {
              signOut();
              // _fireBaseMethods.signOut();
              // Navigator.pushNamed(context, '/SignIn');
            },
            child: const Text(
              "Logout",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
