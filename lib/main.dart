import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/practice/chat/chat_screen.dart';
import 'package:flutter_practice/practice/chat/chat_splash.dart';
import 'package:flutter_practice/practice/chat/login_screen.dart';
import 'package:flutter_practice/practice/map/auto_complete.dart';
import 'package:flutter_practice/practice/provider/counter_with_provider.dart';
import 'package:flutter_practice/practice/provider/dark_theme_light_theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ChatSplash();
                }
                if (snapshot.hasData) {
                  return const ChatScreen();
                }
                return const LoginScreen();
              },
            ),
          ),
        ));
  }
}
