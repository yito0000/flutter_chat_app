import 'dart:async';
import 'dart:convert';

import 'package:flutter_chat_app/resource/datamodel/message.dart';
import 'package:flutter_chat_app/resource/datamodel/api/message_json.dart';
import 'package:http/http.dart' as http;

class MessageApiProvider {

  final String _host;

  MessageApiProvider(this._host);

  Future<List<Message>> fetchAllMessage() async {
    final response = await http.get("${this._host}/api/messages");
    print('response status: ${response.statusCode}');
    print('response body: ${response.body}');

    if (response.statusCode == 200) {
      List list = json.decode(response.body);
      final jsonList = list.map((e) => MessageJson.fromJson(e));
      return jsonList.map((e) => new Message(e.id, e.text, DateTime.parse(e.dateTime))).toList();
    } else {
      throw Exception('Failed to Load Message Json');
    }

  }

}