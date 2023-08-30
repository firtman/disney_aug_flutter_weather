import 'package:flutter/material.dart';
import 'package:flutter_weather/api.dart';

class FuturePage extends StatelessWidget {
  String cityName;

  FuturePage({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: API().getTemperature(cityName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.hasError) {
            return Text("ERROR");
          } else {
            // WE HAVE THE DATA
            return Center(child: Text("In Ushuaia: ${snapshot.data}⁰F"));
          }
        } else {
          // Loading the data
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
