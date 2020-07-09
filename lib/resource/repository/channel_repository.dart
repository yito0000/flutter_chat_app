import 'package:flutter_chat_app/resource/datamodel/channel.dart';
import 'package:flutter_chat_app/resource/provider/channel_api_provider.dart';

class ChannelRepository {

  final ChannelApiProvider _channelApiProvider = new ChannelApiProvider("http://localhost:8080");

  Future<List<Channel>> fetchAll() => this._channelApiProvider.fetchAllChannel();
}