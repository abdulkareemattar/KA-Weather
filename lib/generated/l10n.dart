// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to our cutting-edge application, delivering precise insights on weather conditions, humidity levels, and atmospheric pressure for any city worldwide.`
  String get onboard1 {
    return Intl.message(
      'Welcome to our cutting-edge application, delivering precise insights on weather conditions, humidity levels, and atmospheric pressure for any city worldwide.',
      name: 'onboard1',
      desc: '',
      args: [],
    );
  }

  /// `Embark on a journey of discovery with our advanced app, providing comprehensive data on weather forecasts, humidity, and pressure fluctuations with unparalleled accuracy.`
  String get onboard2 {
    return Intl.message(
      'Embark on a journey of discovery with our advanced app, providing comprehensive data on weather forecasts, humidity, and pressure fluctuations with unparalleled accuracy.',
      name: 'onboard2',
      desc: '',
      args: [],
    );
  }

  /// `Elevate your weather tracking experience with our sophisticated application, offering real-time updates on weather patterns, humidity statuses, and atmospheric pressures for every city you explore.`
  String get onboard3 {
    return Intl.message(
      'Elevate your weather tracking experience with our sophisticated application, offering real-time updates on weather patterns, humidity statuses, and atmospheric pressures for every city you explore.',
      name: 'onboard3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Start search to your region now ! `
  String get hometext {
    return Intl.message(
      'Start search to your region now ! ',
      name: 'hometext',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Enter a city name or country`
  String get enteracity {
    return Intl.message(
      'Enter a city name or country',
      name: 'enteracity',
      desc: '',
      args: [],
    );
  }

  /// `Weather`
  String get weather {
    return Intl.message(
      'Weather',
      name: 'weather',
      desc: '',
      args: [],
    );
  }

  /// `Search a city or country`
  String get searchacity {
    return Intl.message(
      'Search a city or country',
      name: 'searchacity',
      desc: '',
      args: [],
    );
  }

  /// `Last Update`
  String get lastupdate {
    return Intl.message(
      'Last Update',
      name: 'lastupdate',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get Date {
    return Intl.message(
      'Date',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `Pressure`
  String get pressure {
    return Intl.message(
      'Pressure',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get Humidity {
    return Intl.message(
      'Humidity',
      name: 'Humidity',
      desc: '',
      args: [],
    );
  }

  /// `Max Temp`
  String get maxtemp {
    return Intl.message(
      'Max Temp',
      name: 'maxtemp',
      desc: '',
      args: [],
    );
  }

  /// `Min Temp`
  String get mintemp {
    return Intl.message(
      'Min Temp',
      name: 'mintemp',
      desc: '',
      args: [],
    );
  }

  /// `millibars`
  String get millibars {
    return Intl.message(
      'millibars',
      name: 'millibars',
      desc: '',
      args: [],
    );
  }

  /// `Feels like`
  String get itsfeels {
    return Intl.message(
      'Feels like',
      name: 'itsfeels',
      desc: '',
      args: [],
    );
  }

  /// `Sunny`
  String get Sunny {
    return Intl.message(
      'Sunny',
      name: 'Sunny',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get Clear {
    return Intl.message(
      'Clear',
      name: 'Clear',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get Sun {
    return Intl.message(
      'Sun',
      name: 'Sun',
      desc: '',
      args: [],
    );
  }

  /// `Partly Cloudy`
  String get PartlyCloudy {
    return Intl.message(
      'Partly Cloudy',
      name: 'PartlyCloudy',
      desc: '',
      args: [],
    );
  }

  /// `Cloudy`
  String get Cloudy {
    return Intl.message(
      'Cloudy',
      name: 'Cloudy',
      desc: '',
      args: [],
    );
  }

  /// `Overcast`
  String get Overcast {
    return Intl.message(
      'Overcast',
      name: 'Overcast',
      desc: '',
      args: [],
    );
  }

  /// `Mist`
  String get Mist {
    return Intl.message(
      'Mist',
      name: 'Mist',
      desc: '',
      args: [],
    );
  }

  /// `Fog`
  String get Fog {
    return Intl.message(
      'Fog',
      name: 'Fog',
      desc: '',
      args: [],
    );
  }

  /// `Freezing Fog`
  String get FreezingFog {
    return Intl.message(
      'Freezing Fog',
      name: 'FreezingFog',
      desc: '',
      args: [],
    );
  }

  /// `Patchy Rain Possible`
  String get PatchyRainPossible {
    return Intl.message(
      'Patchy Rain Possible',
      name: 'PatchyRainPossible',
      desc: '',
      args: [],
    );
  }

  /// `Light Rain`
  String get LightRain {
    return Intl.message(
      'Light Rain',
      name: 'LightRain',
      desc: '',
      args: [],
    );
  }

  /// `Moderate Rain`
  String get ModerateRain {
    return Intl.message(
      'Moderate Rain',
      name: 'ModerateRain',
      desc: '',
      args: [],
    );
  }

  /// `Heavy Rain`
  String get HeavyRain {
    return Intl.message(
      'Heavy Rain',
      name: 'HeavyRain',
      desc: '',
      args: [],
    );
  }

  /// `Torrential Rain Shower`
  String get TorrentialRainShower {
    return Intl.message(
      'Torrential Rain Shower',
      name: 'TorrentialRainShower',
      desc: '',
      args: [],
    );
  }

  /// `Contains Rain`
  String get Rain {
    return Intl.message(
      'Contains Rain',
      name: 'Rain',
      desc: '',
      args: [],
    );
  }

  /// `Patchy Snow Possible`
  String get PatchySnowPossible {
    return Intl.message(
      'Patchy Snow Possible',
      name: 'PatchySnowPossible',
      desc: '',
      args: [],
    );
  }

  /// `Light Snow`
  String get LightSnow {
    return Intl.message(
      'Light Snow',
      name: 'LightSnow',
      desc: '',
      args: [],
    );
  }

  /// `Moderate Snow`
  String get ModerateSnow {
    return Intl.message(
      'Moderate Snow',
      name: 'ModerateSnow',
      desc: '',
      args: [],
    );
  }

  /// `Heavy Snow`
  String get HeavySnow {
    return Intl.message(
      'Heavy Snow',
      name: 'HeavySnow',
      desc: '',
      args: [],
    );
  }

  /// `Light Snow Showers`
  String get LightSnowShowers {
    return Intl.message(
      'Light Snow Showers',
      name: 'LightSnowShowers',
      desc: '',
      args: [],
    );
  }

  /// `Moderate or Heavy Snow Showers`
  String get ModerateorHeavySnowShowers {
    return Intl.message(
      'Moderate or Heavy Snow Showers',
      name: 'ModerateorHeavySnowShowers',
      desc: '',
      args: [],
    );
  }

  /// `Snow`
  String get Snow {
    return Intl.message(
      'Snow',
      name: 'Snow',
      desc: '',
      args: [],
    );
  }

  /// `Patchy Sleet Possible`
  String get patchysleetpossible {
    return Intl.message(
      'Patchy Sleet Possible',
      name: 'patchysleetpossible',
      desc: '',
      args: [],
    );
  }

  /// `Light Sleet`
  String get LightSleet {
    return Intl.message(
      'Light Sleet',
      name: 'LightSleet',
      desc: '',
      args: [],
    );
  }

  /// `Moderate or Heavy Sleet`
  String get ModerateorHeavySleet {
    return Intl.message(
      'Moderate or Heavy Sleet',
      name: 'ModerateorHeavySleet',
      desc: '',
      args: [],
    );
  }

  /// `Light Sleet Showers`
  String get LightSleetShowers {
    return Intl.message(
      'Light Sleet Showers',
      name: 'LightSleetShowers',
      desc: '',
      args: [],
    );
  }

  /// `Moderate or Heavy Sleet Showers`
  String get ModerateorHeavySleetShowers {
    return Intl.message(
      'Moderate or Heavy Sleet Showers',
      name: 'ModerateorHeavySleetShowers',
      desc: '',
      args: [],
    );
  }

  /// `Sleet`
  String get Sleet {
    return Intl.message(
      'Sleet',
      name: 'Sleet',
      desc: '',
      args: [],
    );
  }

  /// `Patchy Freezing Drizzle Possible`
  String get PatchyFreezingDrizzlePossible {
    return Intl.message(
      'Patchy Freezing Drizzle Possible',
      name: 'PatchyFreezingDrizzlePossible',
      desc: '',
      args: [],
    );
  }

  /// `Freezing Drizzle`
  String get FreezingDrizzle {
    return Intl.message(
      'Freezing Drizzle',
      name: 'FreezingDrizzle',
      desc: '',
      args: [],
    );
  }

  /// `Heavy Freezing Drizzle`
  String get HeavyFreezingDrizzle {
    return Intl.message(
      'Heavy Freezing Drizzle',
      name: 'HeavyFreezingDrizzle',
      desc: '',
      args: [],
    );
  }

  /// `Drizzle`
  String get Drizzle {
    return Intl.message(
      'Drizzle',
      name: 'Drizzle',
      desc: '',
      args: [],
    );
  }

  /// `Thunder`
  String get Thunder {
    return Intl.message(
      'Thunder',
      name: 'Thunder',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Select your language`
  String get selectyourlanguage {
    return Intl.message(
      'Select your language',
      name: 'selectyourlanguage',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get AboutUs {
    return Intl.message(
      'About Us',
      name: 'AboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Contact with me`
  String get Contactwithme {
    return Intl.message(
      'Contact with me',
      name: 'Contactwithme',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
