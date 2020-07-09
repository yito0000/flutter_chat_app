import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/channel_list.dart';

import 'widgets/random_words.dart';

void main() => runApp(MaterialApp(
  title: "Using Tabs",
  home: MainApp(),
));

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainAppState();

}

class MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {

  TabController _tabController;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bottom navigator bar"),
        backgroundColor: Colors.cyan,
      ),
      body: TabBarView(
        children: <Widget>[ChannelList(), RandomWords(), RandomWords()],
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.cyan,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.chat_bubble),
            ),
            Tab(
              icon: Icon(Icons.access_time),
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

}