import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/weatherController.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());

    return Scaffold(
      backgroundColor: Color(0xFF48b1e9),
      appBar: AppBar(
        backgroundColor: Color(0xFF48b1e9),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.location_on_outlined, color: Colors.white),
                ),
                SizedBox(width: 10),
                Obx(() => Text(
                  "${weatherController.cityName.value}",
                  style: TextStyle(color: Colors.white),
                )),
                SizedBox(width: 10),
                Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white),
              ],
            ),
            Icon(Icons.add_alert, color: Colors.white),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 70),
                Transform.scale(
                scale: 4.0,
                child: Obx(() => Image.network(weatherController.urlIcon.value)),
                ),
                SizedBox(height: 120),
                    Container(
                          width: 353,
                          height: 335,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(() => Text(
                                    'Today: ${weatherController.localtime}',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  )
                                ),
                                Obx(() => Text(
                    "${weatherController.temp_c}",
                    style: TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.w400,fontFamily: "Overpass"),
                  )),
                                SizedBox(height: 20),
                                 Obx(() => Text(
                    "${weatherController.weatherText}",
                    style: TextStyle(color: Colors.white, fontSize: 24,fontFamily: 'Overpass',fontWeight: FontWeight.w400),
                  )), 
                                SizedBox(height: 50),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 70),
                      Icon(Icons.air, color: Color.fromRGBO(255, 255, 255, 1)),
                      SizedBox(width: 11),
                      Text(
                        'Wind',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                      SizedBox(width: 25),
                      Text(
                        '|',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                      SizedBox(width: 15),
                       Obx(() => Text(
                    "${weatherController.windSpeed} km/h",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                    ],
                                ),
                               Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 70),
                      Icon(Icons.water_drop_outlined, color: Color.fromRGBO(255, 255, 255, 1)),
                      SizedBox(width: 11),
                      Text(
                        'Hum',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                      SizedBox(width: 27),
                      Text(
                        '|',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                      SizedBox(width: 15),
                       Obx(() => Text(
                    "${weatherController.humidity}%",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                    ],
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 60),
                       Container(
        width: 220,
        height: 64,
        child: MaterialButton(
          onPressed: () {
            Get.offNamed("detailspage");
            print("================================lat=${weatherController.latitude}");
            print("================================long=${weatherController.longitude}");
          },
          color: Color(0xFFFFFFFF),  
          elevation: 6,
          highlightElevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forecast report',
                style: TextStyle(
                  fontFamily: 'Overpass',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF444E72),  // Text color
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_upward,
                color: Color(0xFF444E72),  // Icon color
              ),
            ],
          ),
        ),
            )
                        
              ],
            ),
          ],
        ),
      )

    );
  }
}
