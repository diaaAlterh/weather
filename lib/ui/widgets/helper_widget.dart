import 'package:flutter/material.dart';
import 'package:weather/helper/appColors.dart';
import 'package:weather/ui/widgets/animationScaleWidget.dart';

class HelperWidget {
  ///replacing the api images to the local icons
  Map imagePath = {
    '01n': 'images/Clear Night.png',
    '01d': 'images/Mostly Sunny.png',
    '02d': 'images/Party Cloudy.png',
    '02n': 'images/Party Cloudy Night.png',
    '03d': 'images/Mostly Cloudy.png',
    '03n': 'images/Mostly Cloudy Night.png',
    '04n': 'images/Mostly Cloudy Night.png',
    '04d': 'images/Mostly Cloudy.png',
    '09d': 'images/Heavy Rain.png',
    '09n': 'images/Heavy Rain Night.png',
    '10d': 'images/Rain.png',
    '10n': 'images/Rain Night.png',
    '11d': 'images/Scattered Thunderstorm.png',
    '11n': 'images/Scattered Thunderstorm Night.png',
    '13d': 'images/Snow.png',
    '13n': 'images/Snow Night.png',
    '50n': 'images/Breezy.png',
    '50d': 'images/Breezy.png',
  };

  /// day weather for both screens
  Widget weatherDay(
      {required String cityName,
      required String date,
      required String weatherState,
      required String tempMinMax,
      required String iconPath,
      required String temp,
      required int index}) {
    return Column(
      children: [
        AnimationScaleWidget(
          position: 0,
          verticalOffset: 10,
          horizontalOffset: 0,
          child: Container(
            margin:
                const EdgeInsets.only(top: 30, bottom: 20, left: 35, right: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cityName,
                  style: TextStyle(fontSize: 20, color: AppColors.fontColor),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 20, color: AppColors.fontColor),
                ),
              ],
            ),
          ),
        ),
        AnimationScaleWidget(
          position: 0,
          verticalOffset: 10,
          horizontalOffset: 0,
          child: Container(
            margin: const EdgeInsets.only(left: 35, right: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weatherState,
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  tempMinMax,
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        AnimationScaleWidget(
          position: 0,
          verticalOffset: 0,
          horizontalOffset: 30,
          child: Container(
            margin:
                const EdgeInsets.only(right: 35, left: 35, top: 50, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: index,
                  child: Image.asset(
                    iconPath,
                    height: 90,
                    width: 90,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          temp,
                          style: TextStyle(
                              fontSize: 90,
                              color: AppColors.fontColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: Text(
                          '\u2103',
                          style: TextStyle(
                              fontSize: 25,
                              color: AppColors.fontColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

HelperWidget helperWidget = HelperWidget();
