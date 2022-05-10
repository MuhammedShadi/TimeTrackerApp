import 'package:flutter/material.dart';
import 'package:timetracker/fireBase/fireBaseMethods.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FireBaseMethods _fireBaseMethods = FireBaseMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          MaterialButton(
            onPressed: () {
              _fireBaseMethods.signOut();
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
