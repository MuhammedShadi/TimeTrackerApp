import 'package:flutter/material.dart';
import 'package:timetracker/widgets/formSubmitButton.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  const EmailSignInForm({Key? key}) : super(key: key);

  @override
  State<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   EmailSignInFormType _formType = EmailSignInFormType.signIn;

  void _submit() {}

  void _toggleFormType() {
    setState(() {
      _formType =  _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? "Sign in"
        : "Create an account";
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? "Need an account ? Register"
        : " Have an account ? Sign in ";
    return [
      TextField(
        controller: _emailController,
        decoration: const InputDecoration(
          labelText: "Email",
          hintText: "test@test.com",
        ),
      ),
      const SizedBox(height: 8),
      TextField(
        controller: _passwordController,
        decoration: const InputDecoration(
          labelText: "Password",
        ),
        obscureText: true,
      ),
      const SizedBox(height: 10),
      FormSubmitButton(text: primaryText, onPressed: _submit),
      FlatButton(child: Text(secondaryText), onPressed: _toggleFormType),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildren(),
      ),
    );
  }
}
