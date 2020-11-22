import 'dart:async';
import 'dart:convert';

import 'package:flutter_chat_app/resource/datamodel/message.dart';
import 'package:flutter_chat_app/resource/datamodel/api/message_json.dart';
import 'package:http/http.dart' as http;

class MessageApiProvider {

  final String _host;

  http.Client _client = http.Client();

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

  void method() {
    var request = http.Request("GET", Uri.parse("http://localhost:8080/api/stream-sse"));
    request.headers["Accept"] = "text/event-stream";
    request.headers["Cache-Control"] = "no-cache";
    Future<http.StreamedResponse> response = _client.send(request);
    print("Subscribed!");
    response.asStream().listen((streamedResponse) {
      streamedResponse.stream.listen((data) {
        var jsonData = json.decode(utf8.decode(data).split("data:")[1]) as Map<String, dynamic>;
        print("Received data => $jsonData");
      });
    });

  }
}