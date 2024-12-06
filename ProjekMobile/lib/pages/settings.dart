import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Function(bool) toggleTheme; // Fungsi untuk mengganti tema
  final bool isDarkMode; // Nilai awal apakah dalam mode gelap

  const SettingsPage({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode; // Mengambil nilai awal dari widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value; // Update state lokal
                  });
                  widget.toggleTheme(value); // Mengganti tema global
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
