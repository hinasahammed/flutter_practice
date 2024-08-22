import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkThemeLightTheme extends StatelessWidget {
  const DarkThemeLightTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) => Column(
            children: [
              Card(
                child: SwitchListTile(
                  title: Text(value.isDarkTheme ? "Dark mode" : "Light mode"),
                  value: value.isDarkTheme,
                  onChanged: (value) {
                    provider.changeTheme(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = true;

  bool get isDarkTheme => _isDarkTheme;

  void changeTheme(bool newValue) {
    _isDarkTheme = newValue;
    notifyListeners();
  }
}
