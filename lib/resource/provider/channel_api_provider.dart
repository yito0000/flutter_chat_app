import 'dart:async';
import 'dart:convert';

import 'package:flutter_chat_app/resource/datamodel/api/channel_json.dart';
import 'package:flutter_chat_app/resource/datamodel/channel.dart';
import 'package:http/http.dart' as http;

class ChannelApiProvider {

  final String _host;

  ChannelApiProvider(this._host);

  Future<List<Channel>> fetchAllChannel() async {
    final response = await http.get("${this._host}/api/channels");
    print('response status: ${response.statusCode}');
    print('response body: ${response.body}');

    if (response.statusCode == 200) {
      List list = json.decode(response.body);
      final jsonList = list.map((e) => ChannelJson.fromJson(e));
      return jsonList.map((e) => new Channel(e.id, e.name, (e.isPrivate == 'true'), DateTime.parse(e.updateTime))).toList();
    } else {
      throw Exception('Failed to Load Message Json');
    }

  }

}