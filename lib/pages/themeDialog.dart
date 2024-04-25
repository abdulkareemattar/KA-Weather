import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/theme_Provider.dart';
import '../catgeory/settingcontainer.dart';
import 'home_screen.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness theme = Provider.of<ThemeProvider>(context).thememode;

    return settingcontainer(
      color: Colors.purpleAccent,
      icon: Icons.light_mode,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(backgroundColor: (theme==Brightness.dark)?darkpurple:lightpurple,
            shadowColor: (theme==Brightness.dark)?darkpurple:lightpurple,
            children: [
              SimpleDialogOption(
                child: Text("Light Mode"),
                onPressed: () {
                  Provider.of<ThemeProvider>(context,listen: false)
                      .changeTheme('Brightness.light');
                },
              ),
              SimpleDialogOption(
                child: Text("Dark Mode"),
                onPressed: () {
                  Provider.of<ThemeProvider>(context,listen: false)
                      .changeTheme('Brightness.dark');
                },
              ),
            ],
          ),
        );
      },
      text: 'Theme',
    );
  }
}
