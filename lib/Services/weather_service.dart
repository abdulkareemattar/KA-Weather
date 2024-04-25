import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';

class Weatherservice {
  String baseurl = 'http://api.weatherapi.com/v1/';
  String apikey = 'e85b96f886e6407a991144910241803';

  Future<WeatherModel> getweather({required String cityname}) async {
    Uri url =
        Uri.parse("${baseurl}forecast.json?key=$apikey&q=$cityname&days=7");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weatherModel = WeatherModel.fromjson(data);
    return weatherModel;
  }
}
