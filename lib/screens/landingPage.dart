import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timetracker/screens/HomePage.dart';
import 'package:timetracker/screens/SignInPage.dart';

import '../fireBase/fireBaseMethods.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  // final AuthBase auth;
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;


  @override
  void initState() {
    super.initState();
    // widget.auth.authStatChange().listen((event) {
    //   print("uid${_user?.uid}");
    // });
    updateUser(FirebaseAuth.instance.currentUser);
  }

  void updateUser(User? user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return  SignInPage(
        onSignIn: (user) => updateUser(user),
      );
    } else {
      return  HomePage(onSignOut: ()=>updateUser(null),);
    }
  }
}
