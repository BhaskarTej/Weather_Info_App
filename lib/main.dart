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

  void _fetchWeather() {
    setState(() {
      // Simulate fetching weather data based on city name input
      _cityName = _cityController.text;
      _temperature = "25°C"; // Placeholder temperature
      _condition = "Sunny"; // Placeholder condition
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
            Text('City: $_cityName', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text('Temperature: $_temperature', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text('Condition: $_condition', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
