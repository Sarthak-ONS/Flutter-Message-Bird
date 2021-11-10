import 'package:flutter/material.dart';
import 'package:flutter_message_bird/API/google_auth_api.dart';
import 'package:flutter_message_bird/API/send_bird_api.dart';
import 'package:flutter_message_bird/Providers/user_data.dart';
import 'package:provider/provider.dart';

import 'Screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLoggedin = false;
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  autoLogin() async {
    bool loggedIn = await GoogleSignInApi().handleAutoSignIn(context);
    if (loggedIn) {
      setState(() {
        isLoggedin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
