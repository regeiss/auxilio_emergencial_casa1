// Este arquivo pode mais tarde ir para uma pasta geral.
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:gtk_flutter/source/features/responsavel/application/geolocator.dart';

@immutable
class ApiHelper {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';

  static double lat = 0.0;
  static double lon = 0.0;
  static final dio = Dio();

  // static String _constructWeatherUrl() => '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${ApiKey.apiKey}';

  // static Future<Responsavel> getCurrentWeather() async {
  // await fetchLocation();
  // final url = _constructWeatherUrl();
  // final response = await _fetchData(url);
  // return Weather.fromJson(response);
  // }

  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }
}
