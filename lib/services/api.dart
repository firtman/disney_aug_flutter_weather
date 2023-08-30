import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  Future<double> getTemperature(String city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?appid=85ad76cb241ddd400e9c40d1b59c5f74&q=$city&units=imperial";

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final temp = json["main"]["temp"];
      return temp;
    } else {
      throw Exception("HTTP Error code ${response.statusCode}");
    }
  }
}
