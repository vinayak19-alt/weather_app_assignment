import 'package:flutter/material.dart';
import 'weather_model.dart';
import 'weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  String _errorMessage = '';

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchWeatherData(String city) async {
    _isLoading = true;
    notifyListeners();
    try {
      _weather = await WeatherService().fetchWeather(city);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'City not found';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
