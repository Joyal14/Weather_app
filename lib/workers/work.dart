import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  late String locations;
  //Constructor
  Worker({required this.locations}) {
    locations = locations;
  }

  late String temp;
  late String humidity;
  late String airSpeed;
  late String description;
  late String weather;
  late String icons;

  Future<void> getData() async {
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/forecast?q=$locations&appid=602e389765d416ab028f31fb55153262";
      Response response = await get(Uri.parse(url));
      Map data = jsonDecode(response.body);

      //Getting Temp,Humidity
      Map tempData = data['list'][0];
      double getTemp = tempData['main']['temp'] - 273.15;

      int getHumidity = tempData['main']['humidity'];

      Map weatherData = data['list'][1]['weather'][0];
      String getWeather = weatherData['main'];
      String getDesc = weatherData['description'];
      double getAirSpeed = data['list'][3]['wind']['speed'] / 0.28;
      String getIcons = weatherData['icon'].toString();

      //Assiging value
      temp = getTemp.toString();
      humidity = getHumidity.toString();
      airSpeed = getAirSpeed.toString();
      description = getDesc;
      weather = getWeather;
      icons = getIcons;
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      airSpeed = "NA";
      description = "Can't find data";
      weather = "NA";
      icons = "04d";
    }
  }
}
