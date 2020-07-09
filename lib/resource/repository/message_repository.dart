import 'dart:io';

import 'package:flutter_chat_app/resource/datamodel/message.dart';
import 'package:flutter_chat_app/resource/provider/message_api_provider.dart';

class MessageRepository {

  final MessageApiProvider _messageApiProvider = new MessageApiProvider("http://localhost:8080");

  Future<List<Message>> fetchAll() => this._messageApiProvider.fetchAllMessage();

}