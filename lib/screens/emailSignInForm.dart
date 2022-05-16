import 'package:flutter/material.dart';
import 'package:timetracker/fireBase/fireBaseMethods.dart';
import 'package:timetracker/widgets/formSubmitButton.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({Key? key, required this.authBase}) : super(key: key);
  AuthBase authBase;

  @override
  State<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;

  String get _password => _passwordController.text;

  void _submit() async {
    try {
      if (_formType == EmailSignInFormType.signIn) {
        await widget.authBase.signInWithEmailAndPassword(_email, _password);
      } else {
        await widget.authBase.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _updateState() {
    setState(() {});
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
        focusNode: _emailFocusNode,
        decoration: const InputDecoration(
          labelText: "Email",
          hintText: "test@test.com",
        ),
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onEditingComplete: _emailEditingComplete,
        onChanged: (email) => _updateState,
      ),
      const SizedBox(height: 8),
      TextField(
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        decoration: const InputDecoration(
          labelText: "Password",
        ),
        obscureText: true,
        textInputAction: TextInputAction.done,
        onEditingComplete: _submit,
        onChanged: (password) => _updateState,
      ),
      const SizedBox(height: 10),
      FormSubmitButton(
        text: primaryText,
        onPressed: _submit,
      ),
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
