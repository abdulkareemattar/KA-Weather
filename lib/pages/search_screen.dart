import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/weather_provider.dart';
import 'package:weatherapp/Services/weather_service.dart';
import 'package:weatherapp/models/weather_model.dart';

import '../Providers/theme_Provider.dart';
import '../generated/l10n.dart';
import 'found_Data.dart';
import 'home_screen.dart';

String? situation;
String? cityName;

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness theme = Provider.of<ThemeProvider>(context).thememode;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: (theme != Brightness.light)
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [darkorange, darkpurple])
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [lightorange, lightpurple])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            S.of(context).searchacity,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'palabi',
             ),
          ),
          backgroundColor: (theme == Brightness.light) ? lightpurple : darkpurple,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Lottie.asset(
                  'assets/lottie/Animation - 1711115368109.json',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  autocorrect: true,
                  enableSuggestions: true,
                  onSubmitted: (value) async {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()));
                    try {
                      String cityname = value;
                      Weatherservice service = Weatherservice();
                      WeatherModel weather =
                          await service.getweather(cityname: cityname);
                      Navigator.pop(context);
                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityname = cityname;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const foundData(),
                          ));
                      cityName = null;
                    } catch (e) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text(
                              'An error occurred. Please check your internet connection or check the City name'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  onChanged: (value) {
                    cityName = value;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 4,
                        color: Colors.deepPurple,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 4,
                        color: Colors.deepPurple,
                        style: BorderStyle.solid,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    labelText: S.of(context).search,
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'palabi',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    hintText: S.of(context).enteracity,
                    hintStyle: const TextStyle(
                      color: Colors.deepPurple,
                      fontFamily: 'palabi',
                      fontStyle: FontStyle.italic,
                    ),
                    border: const OutlineInputBorder(),
                    suffixIcon: InkWell(
                        radius: 20,
                        onTap: () async {
                          // عرض مؤشر التحميل
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                                child: CircularProgressIndicator()),
                          );

                          try {
                            Weatherservice service = Weatherservice();
                            WeatherModel? weather =
                                await service.getweather(cityname: cityName!);

                            // إغلاق مؤشر التحميل
                            Navigator.pop(context);

                            if (cityName != null) {
                              Provider.of<WeatherProvider>(context,
                                      listen: false)
                                  .weatherData = weather;
                              Provider.of<WeatherProvider>(context,
                                      listen: false)
                                  .cityname = cityName;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const foundData(),
                                  ));
                              cityName = null;
                            }
                          } catch (e) {
                            // إغلاق مؤشر التحميل
                            Navigator.pop(context);

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    'An error occurred. Please check your internet connection or check the city name'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Icon(Icons.search, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
