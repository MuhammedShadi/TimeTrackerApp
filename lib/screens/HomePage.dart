import 'package:flutter/material.dart';
import 'package:timetracker/fireBase/fireBaseMethods.dart';
import 'package:timetracker/theme/showAlertDialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.authBase}) : super(key: key);
  final AuthBase authBase;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final AuthBase _fireBaseMethods = AuthBase();

  Future<void> signOut() async {
    try {
      await widget.authBase.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut() async {
    final didRequestSignOut = await showAlertDialog(context, title: "Logout",
        content: "Are you sure that you want to log out",
        cancelActionText: "Cancel",
        defaultActionText: "Logout");
    if(didRequestSignOut == true){
      signOut();
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
             _confirmSignOut();
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
