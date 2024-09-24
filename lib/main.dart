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
      home: const MyHomePage(title: 'Weather App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _cityName = '';
  String _weatherCondition = '';
  int _temperature = 0;

  // Function to simulate fetching weather data
  void _fetchWeather() {
    setState(() {
      _temperature = 15 + (30 - 15) * (new DateTime.now().second % 100) ~/ 100; // Simulated temperature
      _weatherCondition = ["Sunny", "Cloudy", "Rainy"][(new DateTime.now().second % 3)]; // Simulated weather condition
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Enter City Name'),
              onChanged: (value) {
                setState(() {
                  _cityName = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 20),
            Text(
              'City: $_cityName',
              style: Theme.of(context).textTheme.bodyLarge, // Updated style
            ),
            Text(
              'Temperature: $_temperature°C',
              style: Theme.of(context).textTheme.bodyLarge, // Updated style
            ),
            Text(
              'Condition: $_weatherCondition',
              style: Theme.of(context).textTheme.bodyLarge, // Updated style
            ),
            const SizedBox(height: 40),
            // 7-Day Forecast
            Column(
              children: [
                Text(
                  "7-Day Forecast",
                  style: Theme.of(context).textTheme.displayMedium, // Forecast title style
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    String day = "Day ${index + 1}";
                    String forecast = "Sunny, 25°C"; // Example forecast data
                    return ListTile(
                      title: Text(day),
                      subtitle: Text(forecast),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//Correct Code