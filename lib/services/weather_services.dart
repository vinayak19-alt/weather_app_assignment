import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  Future<Weather> fetchWeather(String city) async {
    final apiKey = '5ff7f9c080e70e1abfa70a93ee60bb65';
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      return Weather.fromJson(jsonData);
    } else {
      throw Exception('Error fetching weather data');
    }
  }
}
