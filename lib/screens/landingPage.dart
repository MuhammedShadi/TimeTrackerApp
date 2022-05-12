import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timetracker/screens/HomePage.dart';
import 'package:timetracker/screens/SignInPage.dart';

import '../fireBase/fireBaseMethods.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key, required this.authBase}) : super(key: key);
  final AuthBase authBase;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authBase.authStatChange(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            if (user == null) {
              return SignInPage(
                authBase: authBase,
              );
            } else {
              return HomePage(
                authBase: authBase,
              );
            }
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
