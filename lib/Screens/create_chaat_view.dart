import 'package:flutter/material.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class ChannelListView extends StatefulWidget {
  const ChannelListView({Key? key}) : super(key: key);

  @override
  _ChannelListViewState createState() => _ChannelListViewState();
}

class _ChannelListViewState extends State<ChannelListView>
    with ChannelEventHandler {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
