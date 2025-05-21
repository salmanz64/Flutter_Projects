import 'package:flutter/material.dart';
import 'package:habit_now/themes/themeProvider.dart';
import 'package:provider/provider.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  bool isLightMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text("Settings")),
      body: Column(
        children: [
          ListTile(
            leading: Text(
              "Switch To Lightmode Or DarkMode",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            trailing: Switch(
              value: isLightMode,
              onChanged: (value) {
                setState(() {
                  isLightMode = !isLightMode;
                });
                Provider.of<Themeprovider>(
                  context,
                  listen: false,
                ).toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
