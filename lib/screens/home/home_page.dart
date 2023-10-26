import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String selectedCity = 'Bangkok';
  String unit = '°C';

  Future<Map<String, dynamic>> fetchWeatherData(String city) async {
    final response = await http.get(Uri.parse('YOUR_API_ENDPOINT/city/$city'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(selectedCity);
  }

  void fetchData(String city) {
    fetchWeatherData(city).then((data) {
      setState(() {
        // Update the state with data from the API
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final cities = ['Bangkok', 'London', 'Paris', 'Manchester'];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: cities.map((city) {
            return Text(city);
          }).toList(),
        ),
      ),
      body: Column(
        children: [
          // Other UI components for displaying weather data
        ],
      ),
    );
  }
}
