import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_changer_provider.dart';

class DarkthemeScreen extends StatefulWidget {
  const DarkthemeScreen({super.key});

  @override
  State<DarkthemeScreen> createState() => _DarkthemeScreenState();
}

class _DarkthemeScreenState extends State<DarkthemeScreen> {
  @override
  Widget build(BuildContext context) {
    // print('whole widget build');
    //final Theme_changer = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Theme change'))),
      body: Consumer<ThemeChanger>(
        builder: (context, value, child) {
          print(" build colum only");
          return Column(
            children: [
              RadioListTile<ThemeMode>(
                  title: const Text('Light Mode'),
                  value: ThemeMode.light,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme),
              RadioListTile<ThemeMode>(
                  title: const Text('Dark Mode'),
                  value: ThemeMode.dark,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme),
            ],
          );
        },
      ),
    );
  }
}
