import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class WeatherService {
  final String apiKey = "e640ac88c49641d38b275733242505";
  late double latitude;
  late double longitude;
  var cityName;
  var urlIcon;
  var localtime;
  var temp_c;
  var weatherText;
  var windSpeed;
  var humidity;
  List<double> listTemp = [];
  List<String> listIcons = [];
  List<String> forecastDates = [];
  List<double> tempsByDays = [];
  var forecastData;
  List<String> dateofDays = [];
  List<String> iconsOfDays = [];

  Future<void> getCurrentLocation() async {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> getCurrentWeather(double lat, double lon) async {
    final uri = Uri.parse(
      "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat,$lon&days=3&aqi=no&alerts=no",
    );
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      cityName = jsonDecode(data)['location']['name'];
      urlIcon = jsonDecode(data)["current"]["condition"]["icon"];
      localtime = jsonDecode(data)["location"]["localtime"];
      temp_c = jsonDecode(data)["current"]["temp_c"];
      weatherText=jsonDecode(data)["current"]["condition"]["text"];
      windSpeed=jsonDecode(data)["current"]["wind_kph"];
      humidity =jsonDecode(data)["current"]["humidity"];
      listTemp.clear();
      listIcons.clear();
      for (int i = 0; i < 24; i++) {
        double hourTemp = jsonDecode(data)["forecast"]["forecastday"][0]["hour"][i]["temp_c"];
        String iconUrl = jsonDecode(data)["forecast"]["forecastday"][0]["hour"][i]["condition"]["icon"];
        listTemp.add(hourTemp);
        listIcons.add(iconUrl);
      }
       forecastData = jsonDecode(data)["forecast"]["forecastday"];

      if (forecastData != null && forecastData.length > 0) {
        forecastDates.clear();
        for (var day in forecastData) {
          forecastDates.add(day["date"]);
        }
      }

      for (int i = 0; i < 3; i++) {
        double temp = jsonDecode(data)["forecast"]["forecastday"][i]["day"]["avgtemp_c"];
        tempsByDays.add(temp);
      }

      for (int i = 0; i < 3; i++) {
        String date = jsonDecode(data)["forecast"]["forecastday"][i]["date"];
        DateTime parsedDate = DateTime.parse(date);
        String formattedDate = DateFormat('MMM, d').format(parsedDate);
        dateofDays.add(formattedDate);
        String icon = jsonDecode(data)["forecast"]["forecastday"][i]["day"]["condition"]["icon"];
        iconsOfDays.add(icon);
      }

    } else {
      throw Exception("Something went wrong");
    }
  }

}
