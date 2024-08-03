import 'package:flutter/material.dart';

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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            tabController.index == 0
                ? "one"
                : tabController.index == 1
                    ? "two"
                    : tabController.index == 2
                        ? "three"
                        : "four",
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(controller: tabController, children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.deepPurple,
                ),
              ]),
            ),
            TabBar(
              controller: tabController,
              tabs: [
                Tab(
                  text: "one",
                  icon: Icon(
                    Icons.home,
                    color: Colors.indigo.shade500,
                  ),
                ),
                Tab(
                    text: "two",
                    icon: Icon(
                      Icons.email,
                      color: Colors.indigo.shade500,
                    )),
                Tab(
                    text: "three",
                    icon: Icon(
                      Icons.star,
                      color: Colors.indigo.shade500,
                    )),
                Tab(
                    text: "four",
                    icon: Icon(
                      Icons.person,
                      color: Colors.indigo.shade500,
                    ))
              ],
            ),
          ],
        ));
  }
}
