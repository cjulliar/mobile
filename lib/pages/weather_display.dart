import 'dart:convert';
import 'package:flutter/cupertino.dart';

class WeatherDisplay extends StatelessWidget {
  final String weatherData;

  WeatherDisplay({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final decodedData = jsonDecode(weatherData);
    final weatherDescription = decodedData['weather'][0]['description'];
    final temperature = decodedData['main']['temp'];

    print(Text("Debut de la trace:"));
    print(decodedData);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ville: ${decodedData['name']}',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          'Description: $weatherDescription',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          'Température: ${temperature.toStringAsFixed(2)}°C',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}