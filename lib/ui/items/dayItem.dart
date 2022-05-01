import 'package:flutter/cupertino.dart';
import 'package:weather/helper/appColors.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/ui/widgets/animationScaleWidget.dart';
import 'package:weather/ui/widgets/helper_widget.dart';
import '../../helper/utils.dart';
import '../details_page.dart';

class DayItem extends StatelessWidget {
  int index;
  int positionNum;
  ListElement element;
  bool isFirst;

  DayItem(
      {required this.index,
      this.positionNum = 0,
      required this.element,
      this.isFirst = false});

  @override
  Widget build(BuildContext context) {
    return AnimationScaleWidget(
      position: positionNum,
      horizontalOffset: 100,
      verticalOffset: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => DetailsPage(index)));
        },
        child: Container(
            width: 100,
            margin: EdgeInsets.only(
                right: isFirst ? 35 : 8,
                bottom: 10,
                top: 10,
                left: (index == 4) ? 35 : 8),
            decoration: BoxDecoration(
              color: AppColors.detailsBackgroundColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  utils.format('E\nD/M', element.dtTxt ?? DateTime.now()),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.fontColor, fontSize: 15),
                ),
                Hero(
                  tag: index,
                  child: Image.asset(
                    helperWidget.imagePath[element.weather!.first.icon],
                    height: 40,
                    width: 40,
                  ),
                ),
                Text(
                  element.weather!.first.main,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.fontColor, fontSize: 15),
                ),
                Text(
                  '${element.main!.tempMin.toInt()} / ${element.main!.tempMax.toInt()}\u00B0',
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              ],
            )),
      ),
    );
  }
}
