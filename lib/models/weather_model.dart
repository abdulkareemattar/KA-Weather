import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class WeatherModel {
  String date;
  String time;
  double temp;
  double maxtemp;
  double mintemp;
  String situation;
  int humidity;
  double pressure;
  double feelslike_c;
  String icon;

  WeatherModel({required this.date,
    required this.time,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.situation,
    required this.humidity,
    required this.pressure,
    required this.feelslike_c,
    required this.icon});

  factory WeatherModel.fromjson(dynamic data) {
    var dateortime = data['location']['localtime'];
    List<String> dateandtime = dateortime.split(' ');

    var jsondata = data['forecast']['forecastday'][0];
    return WeatherModel(
        date: dateandtime[0],
        time: dateandtime[1],
        feelslike_c: jsondata['hour'][0]['feelslike_c'],
        humidity: jsondata['hour'][0]['humidity'],
        maxtemp: jsondata['day']['maxtemp_c'],
        mintemp: jsondata['day']['mintemp_c'],
        pressure: jsondata['hour'][0]['pressure_mb'],
        situation: data['current']['condition']['text'],
        temp: jsondata['day']['avgtemp_c'],
        icon: data['current']['condition']['icon']);
  }

  @override
  String toString() {
    return 'data is $date'
        'temp is $temp'
        'maxtemp is $maxtemp and mintemp is $mintemp'
        'humidity is $humidity and pressure is $pressure'
        'this feels like $feelslike_c'
        'the situation id $situation';
  }

  MaterialColor? getColor() {
    if (situation == 'sunny' ||
        situation.contains('sun')) {
      return Colors.amber;
    } else if (situation == 'Partly cloudy' ||
        situation == 'Cloudy' ||
        situation == 'Overcast') {
      return Colors.grey;
    } else if (situation == 'Mist' ||
        situation == 'Fog' ||
        situation == 'Freezing fog' ||
        situation.contains('fog')) {
      return Colors.grey;
    } else if (situation == 'Patchy rain possible' ||
        situation == 'Clear' ||

        situation == 'Light rain' ||
        situation == 'Moderate rain' ||
        situation == 'Heavy rain' ||
        situation == 'Torrential rain shower' ||
        situation.contains('rain')) {
      return Colors.indigo;
    } else if (situation == 'Patchy snow possible' ||
        situation == 'Light snow' ||
        situation == 'Moderate snow' ||
        situation == 'Heavy snow' ||
        situation == 'Light snow showers' ||
        situation == 'Moderate or heavy snow showers' ||
        situation.contains('snow')) {
      return Colors.cyan;
    } else if (situation == 'Patchy sleet possible' ||
        situation == 'Light sleet' ||
        situation == 'Moderate or heavy sleet' ||
        situation == 'Light sleet showers' ||
        situation == 'Moderate or heavy sleet showers' ||
        situation.contains('sleet')) {
      return Colors.grey;
    } else if (situation == 'Patchy freezing drizzle possible' ||
        situation == 'Freezing drizzle' ||
        situation == 'Heavy freezing drizzle' ||
        situation.contains('drizzle')) {
      return Colors.blue;
    } else if (situation.contains('Thunder')) {
      return Colors.purple;
    }
    return Colors.amber;
  }
  String getsituation(BuildContext context) {
    if (situation == 'Sunny') {
      return S.of(context).Sunny;
    }

    else if (situation == 'Clear') {
      return S.of(context).Clear;
    }

    else if (situation.contains('Sun')) {
      return S.of(context).Sunny;
    }

    else if (situation == 'Partly cloudy') {
      return S.of(context).PartlyCloudy;
    }

    else if (situation == 'Cloudy') {
      return S.of(context).Cloudy;
    }

    else if (situation == 'Overcast') {
      return S.of(context).Overcast;
    }

    else if (situation == 'Mist') {
      return S.of(context).Mist;
    }

    else if (situation == 'Fog') {
      return S.of(context).Fog;
    }

    else if (situation == 'Freezing fog') {
      return S.of(context).FreezingFog;
    }

    else if (situation.contains('Fog')) {
      return S.of(context).Fog;
    }

    else if (situation == 'Patchy rain possible') {
      return S.of(context).PatchyRainPossible;
    }

    else if (situation == 'Light rain') {
      return S.of(context).LightRain;
    }

    else if (situation == 'Moderate rain') {
      return S.of(context).ModerateRain;
    }

    else if (situation == 'Heavy rain') {
      return S.of(context).HeavyRain;
    }

    else if (situation == 'Torrential rain shower') {
      return S.of(context).TorrentialRainShower;
    }

    else if (situation.contains('Rain')) {
      return S.of(context).Rain;
    }

    else if (situation == 'Patchy snow possible') {
      return S.of(context).PatchySnowPossible;
    }

    else if (situation == 'Light snow') {
      return S.of(context).LightSnow;
    }

    else if (situation == 'Moderate snow') {
      return S.of(context).ModerateSnow;
    }

    else if (situation == 'Heavy snow') {
      return S.of(context).HeavySnow;
    }

    else if (situation == 'Light snow showers') {
      return S.of(context).LightSnowShowers;
    }

    else if (situation == 'Moderate or heavy snow showers') {
      return S.of(context).ModerateorHeavySnowShowers;
    }

    else if (situation.contains('Snow')) {
      return S.of(context).Snow;
    }

    else if (situation == 'Patchy sleet possible') {
      return S.of(context).patchysleetpossible;
    }

    else if (situation == 'Light sleet') {
      return S.of(context).LightSleet;
    }

    else if (situation == 'Moderate or heavy sleet') {
      return S.of(context).ModerateorHeavySleet;
    }

    else if (situation == 'Light sleet showers') {
      return S.of(context).LightSleetShowers;
    }

    else if (situation == 'Moderate or heavy sleet showers') {
      return S.of(context).ModerateorHeavySleetShowers;
    }

    else if (situation.contains('Sleet')) {
      return S.of(context).Sleet;
    }

    else if (situation == 'Patchy freezing drizzle possible') {
      return S.of(context).PatchyFreezingDrizzlePossible;
    }

    else if (situation == 'Freezing drizzle') {
      return S.of(context).FreezingDrizzle;
    }

    else if (situation == 'Heavy freezing drizzle') {
      return S.of(context).HeavyFreezingDrizzle;
    }

    else if (situation.contains('Drizzle')) {
      return S.of(context).Drizzle;
    }

    else if (situation.contains('Thunder')) {
      return S.of(context).Thunder;
    }

    return S.of(context).Clear;
  }

}


