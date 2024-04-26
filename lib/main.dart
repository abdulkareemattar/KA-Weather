import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/Onboard_Provider.dart';
import 'package:weatherapp/Providers/theme_Provider.dart';
import 'package:weatherapp/pages/home_screen.dart';

import 'Providers/language_Provider.dart';
import 'Providers/weather_provider.dart';
import 'generated/l10n.dart';
import 'onboard/onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherProvider>(
            create: (_) => WeatherProvider()),
        ChangeNotifierProvider<LanguageProvider>(
            create: (_) => LanguageProvider()),
        ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider()),
        ChangeNotifierProvider<OnboardProvider>(
            create: (_) => OnboardProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;
    final weatherData = Provider.of<WeatherProvider>(context).weatherData;
    final theme = Provider.of<ThemeProvider>(context).thememode;

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, _) => SafeArea(
        child: MaterialApp(
            locale: Locale(selectedLanguage),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              brightness: theme,
              primarySwatch:
                  weatherData == null ? Colors.purple : weatherData.getColor(),
            ),
            debugShowCheckedModeBanner: false,
            home: Builder(builder: (context) {
              return AnimatedSplashScreen(
                backgroundColor:
                    (theme == Brightness.dark) ? darkpurple : lightpurple,
                duration: 2000,
                splash: Image.asset(
                  "assets/images/weather-news.png",
                  fit: BoxFit.cover,
                ),
                curve: Curves.easeInOut,
                splashTransition: SplashTransition.slideTransition,
                nextScreen: Onboard(),
              );
            })),
      ),
    );
  }
}
