import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_message_bird/API/google_auth_api.dart';
import 'package:flutter_message_bird/API/send_bird_api.dart';
import 'package:flutter_message_bird/shared_widgets.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRrgJnM9FLGc_bijjNnpD5Fxu6wd6QEwjP2g&usqp=CAU",
              height: 150,
              width: 150,
            ),
            const VerticalSpace(),
            const Text(
              'Message Bird',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const VerticalSpace(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                //Code For Google Login

                final isVerified =
                    await GoogleSignInApi().loginWithGoogle(context);
                print(isVerified);
                if (isVerified) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
                  SendGridAPI().connectUserToSendBirdServer(context);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xff545AEA),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              child: const Text(
                'Login With Google',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
