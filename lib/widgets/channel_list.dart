import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/resource/datamodel/channel.dart';
import 'package:flutter_chat_app/resource/datamodel/message.dart';
import 'package:flutter_chat_app/resource/repository/channel_repository.dart';
import 'package:flutter_chat_app/resource/repository/message_repository.dart';

class ChannelList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChannelListState();

}

class ChannelListState extends State<ChannelList> {

  final ChannelRepository _channelRepository = new ChannelRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<List<Channel>>(
          future: this._channelRepository.fetchAll(),
          builder: (context, snapshot) {
            List<Channel> data = snapshot.data;
            return _buildList(data);
          },
        ),
      ),
    );
  }

  ListView _buildList(List<Channel> list) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return _buildRow(list.elementAt(i));
      },
      itemCount: list.length,
    );
  }

  Widget _buildRow(Channel data) {
    return ListTile(
        title: Text(data.name),
        leading: data.isPrivate ? Icon(Icons.lock) : Icon(Icons.public)
    );
  }
}