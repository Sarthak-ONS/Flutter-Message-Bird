import 'package:flutter/material.dart';
import 'package:flutter_message_bird/Providers/user_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print(Provider.of<UserData>(context, listen: false).email);
              },
              child: Text(
                "Sarthak",
              ),
            )
          ],
        ),
      ),
    );
  }
}
