import 'package:flutter/material.dart';
import 'package:flutter_weather/pages/futurepage.dart';
import 'package:flutter_weather/pages/weatherpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Home Page")),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherPage(
                          title: "Weather",
                          onTemperatureAcquired: (city, temp) {
                            print("The temperature for $city if $temp");
                          },
                        ),
                      ));
                },
                child: const Text(
                  "Weather Page",
                  style: TextStyle(fontSize: 24),
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          body: FuturePage(cityName: "ushuaia"),
                          appBar: AppBar(title: const Text("Future")),
                        ),
                      ));
                },
                child: const Text(
                  "FutureBuilder Page",
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }
}
