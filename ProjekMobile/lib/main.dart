import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabularapp/controller/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabularapp/pages/onboarding.dart';
import 'package:tabularapp/pages/signin.dart';
import 'package:tabularapp/pages/home.dart';
import 'package:tabularapp/pages/history.dart';
import 'package:tabularapp/pages/predict.dart';
import 'package:tabularapp/pages/profile.dart';
import 'package:tabularapp/pages/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadTheme(); // Memuat tema saat aplikasi dimulai
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  Future<void> _toggleTheme(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prediksi Gender',
      theme: ThemeData.light(), // Tema terang
      darkTheme: ThemeData.dark(), // Tema gelap
      themeMode: _themeMode, // Menggunakan tema dinamis
      home: Onboarding(), // Halaman pertama
      routes: {
        '/signin': (context) => const SignIn(),
        '/home': (context) => HomePage(),
        '/history': (context) => HistoryPage(),
        '/predict': (context) => PredictPage(),
        '/profile': (context) => ProfilePage(),
        '/settings': (context) => SettingsPage(
              toggleTheme: _toggleTheme, // Mengoper toggleTheme ke halaman settings
              isDarkMode: _themeMode == ThemeMode.dark,
            ),
      },
    );
  }
}

