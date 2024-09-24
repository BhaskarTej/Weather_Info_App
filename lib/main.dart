import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = "City Name";
  String _temperature = "Temperature";
  String _condition = "Weather Condition";

  // Function to simulate fetching weather data
  void _fetchWeather() {
    setState(() {
      _cityName = _cityController.text.isNotEmpty ? _cityController.text : "Unknown City"; // Show city name or fallback

      // Generate a random temperature between 15°C and 30°C
      final random = Random();
      int temp = 15 + random.nextInt(16); // Random temperature between 15 and 30
      _temperature = '$temp°C';

      // Randomly select a weather condition
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      _condition = conditions[random.nextInt(conditions.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 20),
            // Display city name
            Text('City: $_cityName', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            // Display temperature
            Text('Temperature: $_temperature', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            // Display weather condition
            Text('Condition: $_condition', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
