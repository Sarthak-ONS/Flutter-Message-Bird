import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_message_bird/API/google_auth_api.dart';
import 'package:flutter_message_bird/API/send_bird_api.dart';
import 'package:flutter_message_bird/Providers/user_data.dart';
import 'package:flutter_message_bird/Screens/chat_screen.dart';
import 'package:flutter_message_bird/users.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff545AEA),
        title: const Text(
          'Message Bird',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoogleSignInApi().signout(context);
              SendGridAPI().disconnectFromSendBird();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            if (users[index].userID == Provider.of<UserData>(context).id) {
              return Container();
            }
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      otherUserID: users[index].userID,
                      otherUserName: users[index].name,
                      otherUserPhotoUrl: users[index].photoUrl,
                      otherUserEmail: users[index].email,
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                foregroundImage: NetworkImage(
                  users[index].photoUrl!,
                ),
              ),
              title: Text(
                users[index].name!,
                style: TextStyle(fontSize: 15),
              ),
              subtitle: Text(
                users[index].email!,
                style: TextStyle(fontSize: 12),
              ),
            );
          },
        ),
      ),
    );
  }
}
