import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weatherapp/pages/search_screen.dart';

import '../Providers/theme_Provider.dart';
import '../catgeory/contactchip.dart';
import '../generated/l10n.dart';
import 'home_screen.dart';

void _launchTelegramMeURL() async {
  const url = 'https://t.me/kareemattar';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

void _launchTelegramChannelURL() async {
  const url = 'https://t.me/KAapplications';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

void _launchInstagramURL() async {
  const url =
      'https://www.instagram.com/abdulkareem.attar?igsh=ZGUzMzM3NWJiOQ==';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
void _facebookLaunch() async {
  const url =
      'https://www.facebook.com/kareem.attar2';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

class aboutUs extends StatelessWidget {
  const aboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness theme = Provider.of<ThemeProvider>(context).thememode;

    return Scaffold(
      appBar: AppBar(backgroundColor: (theme==Brightness.dark)?darkpurple:lightpurple,
        title: Text(
          S.of(context).AboutUs,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                height: 250.h,
                width: 250.w,
                decoration: BoxDecoration(
                    color:
                        (theme == Brightness.dark) ? darkpurple : lightpurple,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: (theme == Brightness.dark)
                              ? lightpurple
                              : darkpurple,
                          offset: Offset(10, 10),
                          blurRadius: 30)
                    ]),
                child: Center(
                  child: Text(
                    "This Application Developed By : Abdulkareem Attar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'palabi',
                        fontSize: 20.sp),
                  ),
                ),
              ),
              Chip(
                backgroundColor:
                    (theme == Brightness.dark) ? darkpurple : lightpurple,
                elevation: 5,
                shadowColor:
                    (theme != Brightness.dark) ? darkpurple : lightpurple,
                label: Text(
                  S.of(context).Contactwithme,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'palabi',
                  ),
                ),
              ),
              ContactChip(
                  icon: Icon(
                    Icons.telegram,
                    color: Colors.blue.shade900,
                  ),
                  txt: "Telegram me",
                  fun: () {
                    _launchTelegramMeURL();
                  }),
              ContactChip(
                  icon: Icon(
                    Icons.telegram,
                    color: Colors.blue.shade900,
                  ),
                  txt: "My Apps Channel",
                  fun: () {
                    _launchTelegramChannelURL();
                  }),
              ContactChip(
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.purpleAccent,
                  ),
                  txt: "My Instgram ",
                  fun: () {
                    _launchInstagramURL();
                  }),
              ContactChip(
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blueAccent,
                  ),
                  txt: "My Facebook",
                  fun: () {
                    _facebookLaunch();
                  }),


              const Divider(thickness: 2, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
