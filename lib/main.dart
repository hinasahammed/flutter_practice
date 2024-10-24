import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/payment/payment_option.dart';
import 'package:flutter_practice/practice/hinasprofessionalism/two_auth.dart';
import 'package:flutter_practice/practice/map/distance_test.dart';
import 'package:flutter_practice/practice/map/flutter_map_test.dart';
import 'package:flutter_practice/practice/provider/counter_with_provider.dart';
import 'package:flutter_practice/practice/provider/dark_theme_light_theme.dart';
import 'package:flutter_practice/practice/shimmer/shimmer_list.dart';
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
              home:  const DistanceTest()),
        ));
  }
}
