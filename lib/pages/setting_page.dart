import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/pages/languagedialog.dart';
import 'package:weatherapp/pages/search_screen.dart';
import 'package:weatherapp/pages/themeDialog.dart';

import '../Providers/theme_Provider.dart';
import '../generated/l10n.dart';
import 'home_screen.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness theme = Provider.of<ThemeProvider>(context).thememode;

    return Scaffold(
        appBar: AppBar(backgroundColor: (theme==Brightness.dark)?darkpurple:lightpurple,
          title: Text(
            S.of(context).settings,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'palabi'),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Searchpage(),
                  ),
                );
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            languagedialog(),
            ThemeDialog()
          ],
        ));
  }
}
