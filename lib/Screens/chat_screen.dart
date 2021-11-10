import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_message_bird/Providers/user_data.dart';
import 'package:provider/provider.dart';
import 'package:sendbird_sdk/handlers/channel_event_handler.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key,
      this.otherUserID,
      this.otherUserName,
      this.otherUserPhotoUrl,
      this.otherUserEmail})
      : super(key: key);

  final String? otherUserID;
  final String? otherUserName;
  final String? otherUserPhotoUrl;
  final String? otherUserEmail;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with ChannelEventHandler {
  late GroupChannel _channel;

  List<BaseMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      setupChannel(widget.otherUserID!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.otherUserEmail!,
          style: TextStyle(fontSize: 15),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff545AEA),
        primary: true,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
            Expanded(
              child: ClipOval(
                child: Image.network(
                  widget.otherUserPhotoUrl!,
                  height: 150,
                  width: 150,
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DashChat(
          dateFormat: DateFormat("E, MMM d"),
          timeFormat: DateFormat.jm(),
          showUserAvatar: true,
          messages: [],
          user: ChatUser(),
          sendOnEnter: true,
          textInputAction: TextInputAction.send,
          onSend: (ChatMessage chatMessage) {
            print(chatMessage);
          },
        ),
      ),
    );
  }

  Future setupChannel(String? otherUSerID) async {
    final query = GroupChannelListQuery()
      ..limit = 1
      ..userIdsIncludeIn = [
        Provider.of<UserData>(context, listen: false).id!,
        otherUSerID!,
      ];

    final channels = await query.loadNext();
    if (channels.isEmpty) {
      //Create a new Channel
      _channel = await GroupChannel.createChannel(
        GroupChannelParams()
          ..userIds = [
            Provider.of<UserData>(context, listen: false).id!,
            otherUSerID,
          ],
      );
    }
    _channel = channels[0];
    final messages = await _channel.getMessagesByTimestamp(
      DateTime.now().microsecondsSinceEpoch * 100,
      MessageListParams(),
    );
    setState(() {
      _messages = messages;
    });
  }
}
