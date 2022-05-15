import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker/fireBase/fireBaseMethods.dart';
import 'package:timetracker/screens/signInEmailPage.dart';
import 'package:timetracker/widgets/customesButtons.dart';

import '../theme/theme.dart';

bool modelValue = false;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key, required this.authBase}) : super(key: key);
  final AuthBase authBase;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future<void> signInAnonymously() async {
    try {
      await widget.authBase.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await widget.authBase.signInGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      await widget.authBase.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> logInWithFacebook() async {
    try {
      await widget.authBase.loginWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void SignInEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => SignInEmailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Time Tracker")),
        elevation: 5.0,
        actions: <Widget>[
          modelValue == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      modelValue = false;
                      print(modelValue);
                      _themeChanger.setTheme(ThemeData.dark());
                    });
                  },
                  icon: const Icon(Icons.wb_sunny_outlined),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      modelValue = true;
                      print(modelValue);
                      _themeChanger.setTheme(ThemeData.light());
                    });
                  },
                  icon: const Icon(Icons.wb_sunny),
                ),
        ],
      ),
      body: buildContain(),
    );
  }

  Container buildContain() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign in",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          CustomeRaisedButton(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/images/google-logo.png"),
                  const Text(
                    "Sign in with Google",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Opacity(
                      opacity: 0,
                      child: Image.asset("assets/images/google-logo.png")),
                ],
              ),
              borderRadius: 10,
              onPressed: () {
                signInWithGoogle();
              }),
          const SizedBox(height: 8),
          CustomeRaisedButton(
              color: const Color(0xFF334D92),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/images/facebook-logo.png"),
                  const Text(
                    "Sign in with Facebook",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Opacity(
                      opacity: 0,
                      child: Image.asset("assets/images/facebook-logo.png")),
                ],
              ),
              borderRadius: 10,
              onPressed: () {
                logInWithFacebook();
              }),
          const SizedBox(height: 8),
          CustomeRaisedButton(
              color: Colors.teal,
              child: const Text(
                "Sign in with email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              borderRadius: 10,
              onPressed: (){SignInEmail(context);}),
          const SizedBox(height: 8),
          const Text(
            "or",
            style: TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          CustomeRaisedButton(
              color: Colors.yellow.shade700,
              child: const Text(
                "Go anonymous",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              borderRadius: 10,
              onPressed: () {
                signInAnonymously();
              }),
        ],
      ),
    );
  }
}
