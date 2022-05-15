import 'package:flutter/material.dart';
import 'package:timetracker/screens/emailSignInForm.dart';

import '../fireBase/fireBaseMethods.dart';

class SignInEmailPage extends StatelessWidget {
  const SignInEmailPage({Key? key,required this.authBase}) : super(key: key);
  final AuthBase authBase;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Sign in")),
        elevation: 5.0,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: EmailSignInForm(authBase: authBase,),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

}
