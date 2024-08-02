import 'package:flutter/material.dart';
import 'package:flutter_practice/practice/listview/listview_and_seperated.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class CustomSliderDrawer extends StatefulWidget {
  const CustomSliderDrawer({super.key});

  @override
  State<CustomSliderDrawer> createState() => _CustomSliderDrawerState();
}

class _CustomSliderDrawerState extends State<CustomSliderDrawer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SliderDrawer(
      //  key: _key,

      animationDuration: 800,

      appBar: SliderAppBar(
        title: Text(
          "Home",
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        appBarColor: theme.colorScheme.surface,
        drawerIconColor: theme.colorScheme.onSurface,
        isTitleCenter: false,

      ),
      slider: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: theme.colorScheme.primaryContainer,
              child: const ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
            );
          }),
      child: const ListviewAndSeperated(),
    ));
  }
}
