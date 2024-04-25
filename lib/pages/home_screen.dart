import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/weather_provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/pages/search_screen.dart';
import 'package:weatherapp/pages/setting_page.dart';

import '../Providers/theme_Provider.dart';
import '../generated/l10n.dart';
import 'aboutUs.dart';

WeatherModel? weatherData;
Color darkpurple = Color(0xff6C009E);
Color lightpurple = Color(0xffE1A4FE);
Color darkorange = Color(0xffFEDF4D);
Color lightorange = Color(0xffFEDF8D);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.name = ''});

  final String? name;

  @override
  Widget build(BuildContext context) {
    Brightness theme = Provider.of<ThemeProvider>(context).thememode;
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor:
                (theme == Brightness.light) ? lightpurple : darkpurple,
            title: Text(
              '${S.of(context).weather} 🌤 ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'palabi',
                color:
                    (theme != Brightness.light) ? Colors.white : Colors.black,
              ),
            ),
            actions: [
              CircleAvatar(
                backgroundColor:
                    (theme == Brightness.light) ? Colors.white : Colors.black,
                child: IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Searchpage(),
                        )),
                    icon: Icon(
                      Icons.search,
                      color: (theme != Brightness.light)
                          ? Colors.amber
                          : Colors.deepPurple,
                    )),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                child: CircleAvatar(
                  backgroundColor:
                      (theme == Brightness.light) ? Colors.white : Colors.black,
                  child: IconButton(
                    onPressed: () => {
                      (theme == Brightness.light)
                          ? Provider.of<ThemeProvider>(context, listen: false)
                              .changeTheme('Brightness.dark')
                          : Provider.of<ThemeProvider>(context, listen: false)
                              .changeTheme('Brightness.light')
                    },
                    icon: (theme == Brightness.light)
                        ? Icon(
                            Icons.light_mode,
                            color: Colors.deepOrange,
                          )
                        : Icon(
                            Icons.dark_mode,
                            color: Colors.yellow,
                          ),
                  ),
                ),
              )
            ]),
        drawer: Drawer(
            backgroundColor:
                (theme == Brightness.dark) ? darkpurple : lightpurple,
            child: ListView(
              itemExtent: 150,
              shrinkWrap: true,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      color: (theme == Brightness.dark)
                          ? darkpurple
                          : lightpurple),
                  child: Center(
                    child: Text(
                      "KA Weather",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'palabi',
                          fontSize: 20.sp),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: ListTile(
                    tileColor:
                        (theme == Brightness.dark) ? darkorange : lightorange,
                    title: Center(
                      child: Row(
                        children: [
                          Text(
                            S.of(context).settings,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'palabi',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          const Spacer(),
                          Lottie.asset(
                              'assets/lottie/Animation - 1712587002465.json',
                              height: 50.h,
                              width: 50.w)
                        ],
                      ),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Setting())),
                  ),
                ),
                ListTile(
                  tileColor:
                      (theme == Brightness.dark) ? darkorange : lightorange,
                  title: Center(
                    child: Row(
                      children: [
                        Text(
                          S.of(context).AboutUs,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'palabi',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        const Spacer(),
                        Lottie.asset(
                            'assets/lottie/Animation - 1713422813806.json',
                            height: 50.h,
                            width: 50.w)
                      ],
                    ),
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const aboutUs())),
                ),
              ],
            )),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: (theme != Brightness.light)
                  ? RadialGradient(colors: [darkorange, darkpurple])
                  : RadialGradient(colors: [lightorange, lightpurple])),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      "${S.of(context).hometext} 🌍 ",
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontFamily: 'palabi',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: Lottie.asset(
                          'assets/lottie/Animation - 1712582418079.json')),
                  ActionChip(
                    shadowColor: Colors.amber,
                    padding: EdgeInsets.all(20.sp),
                    label: Text("${S.of(context).search}  🔍  "),
                    backgroundColor: (theme != Brightness.light)
                        ? darkorange
                        : Colors.purpleAccent,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Searchpage(),
                        )),
                    labelStyle: TextStyle(
                        fontSize: 16.sp,
                        color: (theme == Brightness.light)
                            ? Colors.white
                            : Colors.black,
                        fontFamily: 'palabi',
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
