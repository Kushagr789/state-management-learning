import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/theme_changer.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({super.key});

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Theme Change",),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeProvider.thememode,
              onChanged: themeProvider.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeProvider.thememode,
              onChanged: themeProvider.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeProvider.thememode,
              onChanged: themeProvider.setTheme
          ),
        ],
      ),
    );
  }
}
