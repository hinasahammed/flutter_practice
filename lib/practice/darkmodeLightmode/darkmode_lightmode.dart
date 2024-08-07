import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkmodeLightmode extends StatefulWidget {
  const DarkmodeLightmode({super.key});

  @override
  State<DarkmodeLightmode> createState() => _DarkmodeLightmodeState();
}

class _DarkmodeLightmodeState extends State<DarkmodeLightmode> {
  ValueNotifier<bool> isDarkMode = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    isDarkMode.value = await ChangeTheme().fetchThemeMode();
  }

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
              ValueListenableBuilder(
                valueListenable: isDarkMode,
                builder: (context, isDark, child) {
                  return Card(
                    child: SwitchListTile(
                      value: isDark,
                      onChanged: (newValue) {
                        isDarkMode.value = newValue;
                        ChangeTheme().chengeTheme(newValue);
                      },
                      title: const Text("Darkmode"),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeTheme {
  Future<bool> fetchThemeMode() async {
    final pref = await SharedPreferences.getInstance();
    var val = pref.getBool("isDarkmode");
    return val ?? true;
  }

  void chengeTheme(bool theme) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isDarkmode", theme);
  }
}
