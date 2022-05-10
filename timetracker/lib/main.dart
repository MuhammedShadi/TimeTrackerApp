import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker/screens/screens.dart';
import 'package:timetracker/theme/theme.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(
        ThemeData.light(),
      ),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(builder: (context, theme, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Time Tracker ',
        theme: theme.getTheme(),
        home: const SignInPage(),
      );
    });
  }
}
