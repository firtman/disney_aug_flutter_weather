import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/services/api.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage(
      {super.key, required this.title, required this.onTemperatureAcquired});
  final String title;
  Function onTemperatureAcquired;

  @override
  State<WeatherPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WeatherPage> {
  var cityName = "";
  double? temperature = null;

  searchTemperature() async {
    var temp = await API().getTemperature(cityName);
    setState(() {
      temperature = temp;
    });
    // Pass the information to the parent
    widget.onTemperatureAcquired(cityName, temp);
  }

  var tfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var formValidated = cityName.length >= 3;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text("Enter a city name:"),
              TextField(
                keyboardType: TextInputType.name,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                ],
                onChanged: (value) => setState(() {
                  // check the current value
                  cityName = value;
                }),
              ),
              const SizedBox(height: 20),
              !formValidated
                  ? const Text("City name not valid")
                  : ElevatedButton(
                      onPressed: () {
                        searchTemperature();
                      },
                      child: const Text("Search Weather"),
                    ),
              temperature != null
                  ? Text(
                      "$temperature⁰ F",
                      style: TextStyle(fontSize: 70),
                    )
                  : Text("")
            ],
          ),
        ),
      ),
    );
  }
}
