import 'package:flutter_message_bird/Providers/user_data.dart';
import 'package:flutter_message_bird/global_variable.dart';
import 'package:provider/provider.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class SendGridAPI {
  final sendbird = SendbirdSdk(appId: sendBirdAppID);

  connectUserToSendBirdServer(context) {
    try {
      final user = sendbird.connect(
        Provider.of<UserData>(context, listen: false).id!,
        accessToken: Provider.of<UserData>(context, listen: false).token!,
      );
    } catch (e) {
      print(e);
    }
  }

  disconnectFromSendBird() {
    sendbird.disconnect();
  }

  createChannel() async {
    OpenChannelParams openChannelParams = OpenChannelParams();
    final openChannel = await OpenChannel.createChannel(openChannelParams);
    print(openChannel.channelUrl);
  }

  Future setupChannel(String? currentUserID, String? otherUSerID) async {
    final query = GroupChannelListQuery()
      ..userIdsIncludeIn = [
        currentUserID!,
        otherUSerID!,
      ];

    final channels = await query.loadNext();
    if (channels.isEmpty) {
      //Create a new Channel
    }
  }
}
