import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/weatherService.dart';

class WeatherController extends GetxController {
  final WeatherService weatherService = WeatherService();
  var cityName = 'Loading...'.obs;
  var urlIcon = 'https://cdn.weatherapi.com/weather/64x64/day/113.png'.obs;
  var localtime = ' 12 September'.obs;
  var temp_c = '32°'.obs;
  var weatherText = 'Claudy'.obs;
  var windSpeed = "45".obs;
  var humidity = "10".obs;
  var listTemp = <double>[].obs;
  var listIcons= <String>[].obs;
  var forecastDates = <String>[].obs;
  var times = ' times'.obs;
  var timestwo = ' times'.obs;
  var timesthree = ' times'.obs;
  var tempsByDays = <double>[].obs;
  var dateofDays = <String>[].obs;
  var iconsOfDays = <String>[].obs;
  late double latitude;
  late double longitude;

  @override
  void onInit() {
    super.onInit();
    getPermession();
  }

  Future<void> getCurrentLocation() async {
    await weatherService.getCurrentLocation();
    await weatherService.getCurrentWeather(weatherService.latitude, weatherService.longitude);
    if (weatherService.cityName != null) {
      cityName.value = weatherService.cityName;
      urlIcon.value = 'https:${weatherService.urlIcon}';

      String localtimeString = weatherService.localtime;
      DateTime parsedDate = DateTime.parse(localtimeString);
      String formattedDate = DateFormat('MMM, d').format(parsedDate);
      localtime.value = formattedDate;

      temp_c.value = weatherService.temp_c.toString() + '°';
      weatherText.value=weatherService.weatherText;
      windSpeed.value = weatherService.windSpeed.toString();
      humidity.value = weatherService.humidity.toString();
      listTemp.clear();
      listTemp.addAll(weatherService.listTemp);
      listIcons.clear();
      listIcons.addAll(weatherService.listIcons);
      forecastDates.clear();
      forecastDates.addAll(weatherService.forecastDates);
      tempsByDays.clear();
      tempsByDays.addAll(weatherService.tempsByDays);
      dateofDays.clear();
      dateofDays.addAll(weatherService.dateofDays);
      iconsOfDays.clear();
      iconsOfDays.addAll(weatherService.iconsOfDays);
      latitude=weatherService.latitude;
      longitude=weatherService.longitude;

    } else {
      cityName.value = 'Unknown Location';
      urlIcon.value = 'https://cdn.weatherapi.com/weather/64x64/night/116.png';
       localtime.value = "Today: 12 September";
      temp_c.value = "60";
      windSpeed.value ="20";
      listTemp.value = [5, 4, 4, 2, 3, 6];
    }
  }

  void getPermession() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    getCurrentLocation();
  }
}
