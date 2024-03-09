import 'package:coinapp/view/splash.dart';
import 'package:coinapp/view/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showSplash = prefs.getBool('showSplash') ?? true;
    setState(() {
      _showSplash = showSplash;
    });

    if (showSplash) {
      await Future.delayed(const Duration(seconds: 5));
      prefs.setBool('showSplash', false);
      setState(() {
        _showSplash = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Colors.white, surfaceTintColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:_showSplash ? const Splash() : const TabbarPage(),
    );
  }
}