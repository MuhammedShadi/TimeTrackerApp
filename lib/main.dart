import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker/screens/screens.dart';
import 'package:timetracker/theme/theme.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
