import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkmodeLightmode extends StatefulWidget {
  const DarkmodeLightmode({super.key});

  @override
  State<DarkmodeLightmode> createState() => _DarkmodeLightmodeState();
}

class _DarkmodeLightmodeState extends State<DarkmodeLightmode> {
  @override
  void initState() {
    super.initState();
    fetchThemeMode();
  }

  void fetchThemeMode() async {
    final pref = await SharedPreferences.getInstance();
    var val = pref.getBool("isDarkmode");
    setState(() {
      isDarkmode = val ?? true;
    });
  }

  void chengeTheme(bool theme) async {
    final pref = await SharedPreferences.getInstance();

    pref.setBool("isDarkmode", theme);

    setState(() {
      isDarkmode = theme;
    });
  }

  bool isDarkmode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: SwitchListTile(
                  value: isDarkmode,
                  onChanged: (newValue) {
                    chengeTheme(newValue);
                  },
                  title: const Text("Darkmode"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
