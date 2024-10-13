import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_assigment/services/weather_provider.dart';
import 'Screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),  // Add your provider here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: WeatherScreen(),  // Ensure the provider is above this widget
      ),
    );
  }
}
