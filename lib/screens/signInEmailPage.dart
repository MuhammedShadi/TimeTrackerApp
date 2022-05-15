import 'package:flutter/material.dart';
import 'package:timetracker/screens/emailSignInForm.dart';

class SignInEmailPage extends StatelessWidget {
  const SignInEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Sign in")),
        elevation: 5.0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: EmailSignInForm(),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

}
