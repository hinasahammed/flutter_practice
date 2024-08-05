import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class DrawerWithPackages extends StatefulWidget {
  const DrawerWithPackages({super.key});

  @override
  State<DrawerWithPackages> createState() => _DrawerWithPackagesState();
}

class _DrawerWithPackagesState extends State<DrawerWithPackages> {
  List<ScreenHiddenDrawer> itens = [];

  @override
  void initState() {
    itens.add(ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Screen 1",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.teal,
          selectedStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        Container(
          color: Colors.red,
        ),),);

    itens.add(ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Screen 2",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        Container(
          color: Colors.green,
        )));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.blueGrey,
      backgroundColorAppBar: Colors.cyan,
      screens: itens,
    );
  }
}
