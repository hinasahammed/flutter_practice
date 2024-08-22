import 'package:flutter/material.dart';
import 'package:flutter_practice/practice/provider/counter_with_provider.dart';
import 'package:flutter_practice/practice/provider/dark_theme_light_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          title: 'Flutter Practice',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness:
                  value.isDarkTheme ? Brightness.dark : Brightness.light,
            ),
            useMaterial3: true,
          ),
          home: const CounterWithProvider(),
        ),
      ),
    );
  }
}
