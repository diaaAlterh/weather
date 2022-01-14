import 'package:flutter/material.dart';
import 'package:weather/helper/appColors.dart';
import 'package:weather/helper/utils.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/ui/widgets/animationScaleWidget.dart';
import 'package:weather/ui/widgets/helper_widget.dart';

class HourItem extends StatelessWidget {

  int index;
  int positionNum;
  ListElement element;

  HourItem({Key? key, required this.index,this.positionNum = 0,required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationScaleWidget(
      position: positionNum,
      milliseconds: 600,
      child: ListTile(
        contentPadding:
        const EdgeInsets.only(left: 40, right: 40),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              helperWidget.imagePath[element.weather!.first.icon],
              height: 30,
              width: 30,
            ),
            Container(
              width: 80,
              margin: const EdgeInsets.only(right: 5),
              child: Text(
                utils.format(
                    'hh:mm',
                    element.dtTxt ??
                        DateTime.now()),
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              child: CircleAvatar(
                radius: 2,
                backgroundColor: AppColors.fontColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              width: 80,
              child: Text(
                element.weather!.first
                    .main
                    .toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 18),
              ),
            ),
          ],
        ),
        trailing: Text(
          '${element.main!.temp.toInt()}\u00B0',
          style: TextStyle(
              fontSize: 20,
              color: AppColors.fontColor,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
