
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/resource/provider/server_sent_event.dart';
import 'package:provider/provider.dart';

class ChannelTimeLine extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ChannelTimeLineState(new List());

}

class ChannelTimeLineState extends State<ChannelTimeLine> {

  final List<String> _list;
  final _bloc = ServerSentEventBloc();
  ChannelTimeLineState(this._list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder<String>(
          stream: this._bloc.event,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              var data = snapshot.data;
              this._list.add(snapshot.data);
            }
            return _buildList(this._list);
          },
        ),
      ),
    );
  }

  ListView _buildList(List<String> list) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return _buildRow(list.elementAt(i));
      },
      itemCount: list.length,
    );
  }

  Widget _buildRow(String data) {
    return ListTile(
        title: Text(data));
  }
}
