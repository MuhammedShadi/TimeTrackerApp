import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timetracker/screens/HomePage.dart';
import 'package:timetracker/screens/SignInPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? _user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    _user;
    auth;
  }


  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return const SignInPage();
    } else {
      return const HomePage();
    }
  }
}
