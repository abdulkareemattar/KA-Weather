import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  String ? cityname;
  bool tapped=false;
  late String situation;
  WeatherModel ? _weatherData;
  set weatherData (WeatherModel ? weather){
    _weatherData=weather;
    notifyListeners();
  }


  WeatherModel? get weatherData =>_weatherData;
  void notify (){
    notifyListeners();
  }

}