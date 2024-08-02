import 'package:flutter/material.dart';

class DrawerPractice extends StatefulWidget {
  const DrawerPractice({super.key});

  @override
  State<DrawerPractice> createState() => _DrawerPracticeState();
}

class _DrawerPracticeState extends State<DrawerPractice> {
  List<MenuItems> items = [
    MenuItems(
      itemName: "Home",
      icon: Icons.home_filled,
      currentIndex: 0,
    ),
    MenuItems(
      itemName: "Search",
      icon: Icons.search,
      currentIndex: 1,
    ),
    MenuItems(
      itemName: "Profile",
      icon: Icons.person,
      currentIndex: 2,
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer"),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        elevation: 1,
        width: size.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final data = items[index];
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Card(
                          color: data.currentIndex == currentIndex
                              ? theme.colorScheme.primaryContainer
                              : theme.colorScheme.primaryContainer
                                  .withOpacity(.2),
                          child: ListTile(
                            leading: Icon(data.icon),
                            title: Text(data.itemName),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItems {
  final String itemName;
  final IconData icon;
  final int currentIndex;

  MenuItems(
      {required this.itemName, required this.icon, required this.currentIndex});
}
