import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:projet_api/pages/weather_display.dart';
import 'package:projet_api/private_access.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String cityName = 'Paris';
  String weatherData = '';

  Future<void> fetchWeatherData() async {
    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        weatherData = response.body;
      });
    } else {
      throw Exception('Échec de la requête à l\'API');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: weatherData.isEmpty
            ? CircularProgressIndicator() // Afficher un indicateur de chargement en attendant la réponse.
            : WeatherDisplay(weatherData: weatherData),
      ),
    );
  }
}