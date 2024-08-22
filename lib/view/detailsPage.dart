import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/weatherController.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({super.key});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  final WeatherController weatherController = Get.put(WeatherController());
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF48b1e9),
      appBar: AppBar(
        backgroundColor: Color(0xFF48b1e9),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.offAllNamed("homepage");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "back",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            Icon(Icons.settings_outlined, color: Colors.white, size: 28),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today", style: TextStyle(color: Colors.white, fontSize: 25)),
                Text("${weatherController.localtime}", style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
            SizedBox(height: 40),
            Container(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weatherController.listTemp.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.only(left: i == 0 ? 0 : 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = (selectedIndex == i) ? -1 : i;
                        });
                      },
                      child: Card(
                        color: selectedIndex == i ? Colors.white.withOpacity(0.6) : Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Obx(() => Text(
                                "${weatherController.listTemp[i].toInt()}°C", // temperatures
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              )),
                              Obx(() => Image.network('https:${weatherController.listIcons[i]}')),
                              Text(
                                "${00 + i}:00",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Next Forecast",style: TextStyle(color: Colors.white, fontSize: 24)),
                Icon(Icons.calendar_month_outlined,color: Colors.white,size: 24)
              ],
            ),
            Container(
              height: 400,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => Text(
                            "${weatherController.dateofDays[i]}",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                          Obx(() => Image.network('https:${weatherController.iconsOfDays[i]}')),
                            Obx(() => Text(
                                  "${weatherController.tempsByDays[i].toInt()}",
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                )),

                        ],
                      ),
                    );
                  },
                ),
            ),

          ],
        ),
      ),
    );
  }
}
