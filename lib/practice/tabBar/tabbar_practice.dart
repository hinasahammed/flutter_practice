import 'package:flutter/material.dart';
import 'package:flutter_practice/practice/tabBar/calls_view.dart';
import 'package:flutter_practice/practice/tabBar/chats_view.dart';
import 'package:flutter_practice/practice/tabBar/community_view.dart';
import 'package:flutter_practice/practice/tabBar/updates_view.dart';

class TabbarPractice extends StatefulWidget {
  const TabbarPractice({super.key});

  @override
  State<TabbarPractice> createState() => _TabbarPracticeState();
}

class _TabbarPracticeState extends State<TabbarPractice> {
  

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            ChatsView(),
            UpdatesView(),
            CommunityView(),
            CallsView(),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicator: BoxDecoration(
              // color: Colors.red,
              ),
          tabs: [
            Tab(
              text: "Chats",
              icon: Icon(
                Icons.chat,
                color: Color.fromARGB(255, 161, 225, 163),
              ),
            ),
            Tab(
              text: "Updates",
              icon: Icon(
                Icons.tips_and_updates,
                color: Color.fromARGB(255, 161, 225, 163),
              ),
            ),
            Tab(
                text: "Communities",
                icon: Icon(
                  Icons.people,
                  color: Color.fromARGB(255, 161, 225, 163),
                )),
            Tab(
              text: "Calls",
              icon: Icon(
                Icons.phone,
                color: Color.fromARGB(255, 161, 225, 163),
              ),
            )
          ],
        ),
      ),
    );
  }
}
