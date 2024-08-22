import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF48b1e9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/weather.png',
              width: 428,
              height: 428,
            ),
            //SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Weather\n',
                    style: TextStyle(color: Colors.white,fontSize: 70,),
                  ),
                  TextSpan(
                    text: 'ForeCasts',
                    style: TextStyle(color: Colors.amber,fontSize: 50,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed("homepage");
              },
              child: Text('Get Start',style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(280, 60),
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
