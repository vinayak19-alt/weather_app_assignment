import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom_container.dart';
import '../services/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(title: Center(child: Text("Weather Forecast")),),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'Enter city name',
                    filled: true, // Enables the fill color
                    fillColor: Colors.white
                ),
                onSubmitted: (value) {
                weatherProvider.fetchWeatherData(value);
                },
              ),
                SizedBox(height: 60,),
                if (weatherProvider.isLoading)
                  CircularProgressIndicator() // Show loading indicator
                else if (weatherProvider.errorMessage.isNotEmpty)
                  Text(weatherProvider.errorMessage, style: TextStyle(color: Colors.red))
                else if (weatherProvider.weather != null) // Only display if weather is not null
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomContainer(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            text: 'City: ${weatherProvider.weather?.cityName}'
                          ),
                          CustomContainer(
                            margin: EdgeInsets.only(left: 100, top: 20),
                              text: 'Temperature: ${weatherProvider.weather?.temperature}°C'
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          CustomContainer(
                              margin: EdgeInsets.only(left: 20, top: 20),
                            text: 'Condition: ${weatherProvider.weather?.condition}'
                          ),
                          CustomContainer(
                            margin: EdgeInsets.only(left: 100, top: 20),
                            text: 'Humidity: ${weatherProvider.weather?.humidity}%',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Center(
                              child: Text('Wind Speed: ${weatherProvider.weather?.windSpeed} m/s',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


