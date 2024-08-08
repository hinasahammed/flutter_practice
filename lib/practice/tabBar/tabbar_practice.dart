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

class _TabbarPracticeState extends State<TabbarPractice>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          ChatsView(),
          UpdatesView(),
          CommunityView(),
          CallsView(),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: tabController,
        indicator: const BoxDecoration(
            // color: Colors.red,
            ),
        tabs: const [
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
    );
  }
}
