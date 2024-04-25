import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/catgeory/settingcontainer.dart';

import '../Providers/language_Provider.dart';
import '../Providers/theme_Provider.dart';
import '../generated/l10n.dart';
import 'home_screen.dart';

class languagedialog extends StatelessWidget {
  const languagedialog({super.key});

  @override
  Widget build(BuildContext context) {

    return settingcontainer(
        text: S.of(context).selectyourlanguage,
        icon: Icons.language,
        color: Colors.purpleAccent,
        onTap: () {
          showLanguageDialog(context);
        });
  }

  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Brightness theme = Provider.of<ThemeProvider>(context).thememode;
        return SimpleDialog(
          shadowColor: (theme == Brightness.dark) ? darkpurple : lightpurple,
          backgroundColor:
              (theme == Brightness.dark) ? darkpurple : lightpurple,
          title: Text(S.of(context).selectyourlanguage),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("en");
                Navigator.pop(context);
              },
              child: const Text('English'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("ar");
                Navigator.pop(context);
              },
              child: const Text('Arabic'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("es");
                Navigator.pop(context);
              },
              child: const Text('Español'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("de");
                Navigator.pop(context);
              },
              child: const Text('Deutsch'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("fr");
                Navigator.pop(context);
              },
              child: const Text('Français'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("hi");
                Navigator.pop(context);
              },
              child: const Text('Hindī'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("it");
                Navigator.pop(context);
              },
              child: const Text('Italiano'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("ja");
                Navigator.pop(context);
              },
              child: const Text('Japanese'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("ko");
                Navigator.pop(context);
              },
              child: const Text('Korean'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("ru");
                Navigator.pop(context);
              },
              child: const Text('Russian'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLanguage("zh");
                Navigator.pop(context);
              },
              child: const Text('Chinese'),
            ),
          ],
        );
      },
    );
  }
}
